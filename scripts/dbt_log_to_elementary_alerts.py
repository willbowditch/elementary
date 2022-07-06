import json
import sys


def get_elementary_log_lines(dbt_log: str):
    return [line for line in dbt_log.splitlines() if 'Elementary' in line]


def get_json_logs(log_lines: [str]):
    json_logs = []
    for log in log_lines:
        try:
            json_logs.append(json.loads(log))
        except json.JSONDecodeError:
            pass
    return json_logs


def get_elementary_alerts(elementary_json_logs: [dict]):
    elementary_alerts = []
    for json_log in elementary_json_logs:
        alerts = json.loads(''.join(json_log['data']['msg'].split('Elementary: ', 1)[1:]))
        elementary_alerts.extend(alerts)
    return elementary_alerts


def main():
    with open(sys.argv[1]) as f:
        dbt_log = f.read()
    elementary_log_lines = get_elementary_log_lines(dbt_log)
    elementary_json_logs = get_json_logs(elementary_log_lines)
    elementary_alerts = get_elementary_alerts(elementary_json_logs)
    with open('elementary_alerts.json', 'w') as f:
        f.write(json.dumps(elementary_alerts))


if __name__ == '__main__':
    main()
