import os
import pickle
from copy import deepcopy as cp
from datetime import datetime, timedelta

fp = '/home/xged/src/data/.timetracker.pickle'
datainit: dict = {"tracking_start": None, "day_start": None, "day_end": 23, "work_hours": {}, "timestamps": []}
BUFFERHOURS = 1

def main():
    currenttime = datetime.now()
    year, week, day = datetime.isocalendar(currenttime)
    with open(fp, "rb+") as f:
        data = pickle.load(f)
        if data["tracking_start"] is None:
            data["tracking_start"] = currenttime
            if data["work_hours"].setdefault(year, {}).setdefault(week, [0, 0, 0, 0, 0, 0, 0])[day-1] == 0:
                data["day_start"] = cp(currenttime) - timedelta(hours=BUFFERHOURS)
            print("Started Tracking..")
        else:
            currentwork = (currenttime - data["tracking_start"]).total_seconds()/3600
            data["work_hours"][year][week][day-1] += currentwork
            hourspassed = (currenttime - data["day_start"]).total_seconds()/3600
            daylength = data["day_end"] - data["day_start"].hour - data["day_start"].minute/60
            dayprediction = daylength*data["work_hours"][year][week][day-1]/hourspassed
            if day == 1:
                weekavg = (sum(data["work_hours"][year][week-1]))/7
            else:
                weekavg = (sum(data["work_hours"][year][week][:day-1]))/(day-1)
            weekprediction = (sum(data["work_hours"][year][week][:day-1])+dayprediction)/day
            data["timestamps"].append((data["tracking_start"], currenttime))
            data["tracking_start"] = None
            print(day, f"{currenttime.hour}:{currenttime.minute} \n")
            print(f'{currentwork:.2f}   {data["work_hours"][year][week][day-1]:.2f}   {dayprediction:.2f}\n')
            print(f"{weekavg:.2f}   {weekprediction:.2f}")
        f.seek(0)
        pickle.dump(data, f)

def read():
    with open(fp, "rb") as f:
        data = pickle.load(f)
    return data

def pread():
    data = read()
    del data["timestamps"]
    return data

def write(data):
    with open(fp, "wb") as f:
        pickle.dump(data, f)

def merge_(source, destination):
    for key, value in source.items():
        if isinstance(value, dict):
            node = destination.setdefault(key, {})
            merge_(value, node)
        else:
            destination[key] = value
    return destination

def add_minutes(minutes, day=None, week=None, year=None):
    currentyear, currentweek, currentday = datetime.isocalendar(datetime.now())
    if day is None: day = currentday
    if week is None: week = currentweek
    if year is None: year = currentyear
    data = read()
    data["work_hours"][year][week][day-1] += minutes/60
    write(data)
    print(data["work_hours"])

def week_avgs():
    with open(fp, "rb") as f:
        data = pickle.load(f)
        for year in data["work_hours"]:
            for week in data["work_hours"][year]:
                print(year, week, f"{sum(data['work_hours'][year][week])/7:.2f}")

if not os.path.exists(fp):
    write(datainit)
    print(datainit)

if __name__ == "__main__":
    main()
