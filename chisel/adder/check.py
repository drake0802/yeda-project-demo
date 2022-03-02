import json
import jsondiff


with open('wave.drom') as wave_file, open('wave.golden.drom') as wave_golden_file:
    input_data = json.load(wave_file)
    golden_data = json.load(wave_golden_file)
    result = {'pass':True}
    res = jsondiff.diff(input_data, golden_data)
    if res:
        result['pass'] = False
    else:
        result['pass'] = True

    print(json.dumps(result))
