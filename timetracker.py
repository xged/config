import os
import pickle
from copy import deepcopy as cp
from datetime import datetime, timedelta

fp = '/home/xged/src/config/.timetracker.pickle'
datainit: dict = {"tracking_start": None, "day_start": None, "work_hours": {}, "timestamps": []}
DAYEND = 22
PREDICTIONBUFFER = 1

def main():
    currentTime = datetime.now()
    year, week, day = datetime.isocalendar(currentTime)
    with open(fp, "rb+") as f:
        data = pickle.load(f)
        if data["tracking_start"] is None:
            data["tracking_start"] = currentTime
            if data["work_hours"].setdefault(year, {}).setdefault(week, [0, 0, 0, 0, 0, 0, 0])[day-1] == 0:
                data["day_start"] = cp(currentTime)
            print("Started Tracking..")
        else:
            currentWork = (currentTime - data["tracking_start"]).total_seconds()/3600
            data["work_hours"][year][week][day-1] += currentWork
            hoursPassed = (currentTime - data["day_start"]).total_seconds()/3600 + PREDICTIONBUFFER
            dayLength = DAYEND - data["day_start"].hour - data["day_start"].minute/60 + PREDICTIONBUFFER
            dayPrediction = dayLength * (data["work_hours"][year][week][day-1]) / hoursPassed
            if day == 1: weekAvg = (sum(data["work_hours"][year][week-1]))/7
            else: weekAvg = (sum(data["work_hours"][year][week][:day-1]))/(day-1)
            weekprediction = (sum(data["work_hours"][year][week][:day-1])+dayPrediction)/day
            if currentWork >= 0.1: data["timestamps"].append((data["tracking_start"], currentTime))
            data["tracking_start"] = None
            print(day, f"{currentTime.hour}:{currentTime.minute} \n")
            print(f'{currentWork:.2f}   {data["work_hours"][year][week][day-1]:.2f}   {dayPrediction:.2f}\n')
            print(f"{weekAvg:.2f}   {weekprediction:.2f}")
        f.seek(0)
        pickle.dump(data, f)

def read():
    with open(fp, "rb") as f: data = pickle.load(f)
    return data

def pread():
    data = read()
    data['timestamps'] = data['timestamps'][-10:]
    return data

def write(data):
    with open(fp, "wb") as f: pickle.dump(data, f)

def merge_(source, destination):
    for key, value in source.items():
        if isinstance(value, dict):
            node = destination.setdefault(key, {})
            merge_(value, node)
        else: destination[key] = value
    return destination

def addMinutes(minutes, day=None, week=None, year=None):
    currentyear, currentweek, currentday = datetime.isocalendar(datetime.now())
    if day is None: day = currentday
    if week is None: week = currentweek
    if year is None: year = currentyear
    data = read()
    data["work_hours"][year][week][day-1] += minutes/60
    write(data)

def weekAvgs():
    with open(fp, "rb") as f:
        data = pickle.load(f)
        for year in data["work_hours"]:
            for week in data["work_hours"][year]: print(year, week, f"{sum(data['work_hours'][year][week])/7:.2f}")

if not os.path.exists(fp):
    write(datainit)
    print(datainit)

if __name__ == "__main__": main()
