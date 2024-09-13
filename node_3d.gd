extends Node3D

@onready var godotmesh : MeshInstance3D = $wildjam
@onready var count : MeshInstance3D = $counter

var godotMeshRes : TextMesh
var countMeshRes : TextMesh


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	godotMeshRes = godotmesh.mesh
	countMeshRes = count.mesh
	_calcTime()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	count.rotate_object_local(Vector3(0,1,0),deg_to_rad(10*delta))


func _calcTime() -> void:
	var t1 = Time.get_unix_time_from_datetime_string ( "2024-09-22 22:00:00" )
	var t2 = Time.get_unix_time_from_system()
	
	var days = int((t1-t2)/60/60/24)
	var hours = int((int(t1-t2)/60/60)%24)
	var minutes = int((int(t1-t2)/60)%60)
	print(str(days) + ":" + str(hours) + ":" + str(minutes))

	countMeshRes.text  = str(days)+":"+str(hours)+":"+str(minutes)


func _on_timer_timeout() -> void:
	_calcTime()

