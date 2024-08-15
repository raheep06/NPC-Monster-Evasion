local replicatedStorage = game:GetService("ReplicatedStorage")

-- Definition of the names for the events in an Array (Group C)
local eventNames = {
	"ChargeEvent",
	"HighJumpEvent",
	"SpikesEvent",
	"ShakeEvent",
	"ThrowRockEvent",
	"TimeSet10Event",
	"TimeSet25Event",
	"TimeSet50Event",
	"YouLostEvent",
	"YouWonEvent",
	"easySurvivalTimeModeEvent",
	"mediumSurvivalTimeModeEvent",
	"hardSurvivalTimeModeEvent"
}

-- Creation of Remote Events Dynamically 
for _, eventName in ipairs(eventNames) do
	local remoteEvent = Instance.new("RemoteEvent")
	remoteEvent.Parent = replicatedStorage
	remoteEvent.Name = eventName
end