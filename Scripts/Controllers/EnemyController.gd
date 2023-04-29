class_name EnemyController

extends Node2D

# variables for player mech
var EnemyMechModel: Mech = Mech.new(
			{
			"body": MechPart.new("body",0, 50),
			"leftArm": MechPart.new("Left Arm", 5, 8),
			"rightArm": MechPart.new("Right Arm", 5, 8),
			"leftLeg": MechPart.new("Left Leg", 6, 4),
			"rightLeg": MechPart.new("Right Leg", 6, 4),
		})
# number of possible actions
var ActionPoints: int = 2
var target: MechPart = MechPart.new("body", 100, 100)
# sequence of actions
var AttackSequence: Array
var TotalDamage: Array

func SequencePartAttack(part: MechPart):
	# if you have the action points, add the attack to sequence
	if ActionPoints != 0:
		AttackSequence.append(part)
		print(AttackSequence.size())
		ActionPoints -= 1
	
func ResolveAttackSequence(opponent: Mech, tempCombatLog: RichTextLabel):
	for part in AttackSequence:
		EnemyMechModel.Attack(part, opponent, target)
		
func DetermineRandomAttackSequence():
	
	for n in ActionPoints:
		match randi() % 4:
			0:
				SequencePartAttack(EnemyMechModel.mechParts["leftLeg"])
			1:
				pass
				SequencePartAttack(EnemyMechModel.mechParts["rightLeg"])
			2:
				pass
				SequencePartAttack(EnemyMechModel.mechParts["leftArm"])
			3:
				pass
				SequencePartAttack(EnemyMechModel.mechParts["rightArm"])
