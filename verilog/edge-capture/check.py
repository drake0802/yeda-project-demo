import json

def check_wave(wave):
    return "1" not in wave

with open('wave.drom') as wave_file:
    data = json.load(wave_file)

    result = {'pass':True}
    for item in data:
        if item != "signal":
            continue

        signal_attr = data[item]
        for attr in signal_attr:
            if attr['name'].endswith('error') or attr['name'].endswith('mismatch'):
                result['pass'] = check_wave(attr['wave'])

    print(json.dumps(result))
