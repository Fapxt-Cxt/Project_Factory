"""logic_solver"""
import re
import json
def parse_scene(file_path):
	"""Read scene form Godot(.tscn)"""
	with open(file_path, "r", encoding="utf-8") as f:
		lines = f.readlines()
	nodes = []
	for line in lines:
		match = re.search(r'node name="([^"]+)"', line)
		if match:
			nodes.append(match.group(1))
	return nodes

def evaluate_logic(nodes):
	"""Set defult of input and map logic gate"""
	inputs = {
		"A": True,
		"B": False
	}
	state = {}
	for node in nodes:
		n = node.lower()

	if n.startswith("and"):
		a = state.get("A", inputs.get("A", False))
		b = state.get("B", inputs.get("B", False))
		state["LED"] = a and b
	elif n.startswith("or"):
		a = state.get("A", inputs.get("A", False))
		b = state.get("B", inputs.get("B", False))
		state["LED"] = a and b
	elif n.startswith("not"):
		a = state.get("A", inputs.get("A", False))
		state["LED"] = not a
	return state

def save_result(result, file_path="logic_result.json"):
	"""save to json"""
	with open(file_path, "w", encoding="utf-8") as f:
		json.dump(result, f, indent = 4, ensure_ascii=False)
	print(f"Logic result saved to {file_path}")

def main():
	"""Put it all together"""
	scene_path = "map4.tscn"
	nodes = parse_scene(scene_path)
	if not nodes:
		print("Not Found")
		return
	result = evaluate_logic(nodes)
	led_state = result.get("LED", False)
	print("LED", led_state)
	save_result({
		"LED": led_state,
		"User_Nodes": nodes
	})
main()
