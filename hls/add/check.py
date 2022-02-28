import json

with open('./proj1/solution1/csim/build/result.json') as json_file:
    data = json.load(json_file)

    result = {}
    if data['error_count'] == 0:
        result['pass'] = True
        result['score'] = 100
    else:
        result['pass'] = False
        result['score'] = 0
    print(json.dumps(result)) 
