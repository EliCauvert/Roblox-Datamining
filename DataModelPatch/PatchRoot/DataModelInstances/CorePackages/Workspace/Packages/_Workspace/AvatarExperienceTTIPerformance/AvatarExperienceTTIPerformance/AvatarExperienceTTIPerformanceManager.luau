local Parent = script:FindFirstAncestor("AvatarExperienceTTIPerformance").Parent
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local FFlagAXTTIEditorEnableMilestones = require(Parent.AvatarExperienceFlags).FFlagAXTTIEditorEnableMilestones
local TTIMetricNamesModule = require(script.Parent.TTIMetricNames)

local function _(Text, p1): string
	local Text1 = "AvatarExperience_" .. Text
	
	if p1 then
		Text1 ..= "_Percieved"
	end
	return Text1
end

local _ = function(p1, p2)
	-- upvalues: TimeToInteractiveTracker (copy)
	if p2 then
		TimeToInteractiveTracker.updateMetadata(p1, p2)
	end
end

local _ = function(p1): boolean
	-- upvalues: TimeToInteractiveTracker (copy)
	local Events = TimeToInteractiveTracker.getEvents()
	
	return Events ~= nil and Events[p1] ~= nil
end

local function createSurface(EventNames)
	-- upvalues: TimeToInteractiveTracker (copy)
	local function batchStart(p1, p2)
		-- upvalues: EventNames (copy), TimeToInteractiveTracker (upval)
		for _, eventName in EventNames do
			local Text = "AvatarExperience_" .. eventName
			
			if p1 then
				Text ..= "_Percieved"
			end
			local Text1: string = Text
			TimeToInteractiveTracker.trackStart(Text1)
			
			if p2 then
				TimeToInteractiveTracker.updateMetadata(Text1, p2)
			end
		end
	end
	
	local function _(Text, p3, p4)
		-- upvalues: TimeToInteractiveTracker (upval)
		local Text1 = "AvatarExperience_" .. Text
		
		if p3 then
			Text1 ..= "_Percieved"
		end
		local Text2: string = Text1
		
		if p3 then
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events == nil or Events[Text2] == nil then return end
		end
		if p4 then
			TimeToInteractiveTracker.updateMetadata(Text2, p4)
		end
		TimeToInteractiveTracker.trackEnd(Text2, if p3 then { cleanupAfterSend = false } else nil)
	end
	
	return {
		eventNames = EventNames,
		startTracking = function(p3)
			-- upvalues: batchStart (copy)
			batchStart(false, p3)
		end,
		startPerceivedTracking = function(p3)
			-- upvalues: batchStart (copy)
			batchStart(true, p3)
		end,
		endTracking = function(Text, p3)
			-- upvalues: TimeToInteractiveTracker (upval)
			local Text1 = "AvatarExperience_" .. Text
			
			if p3 then
				TimeToInteractiveTracker.updateMetadata(Text1, p3)
			end
			TimeToInteractiveTracker.trackEnd(Text1, nil)
		end,
		endPerceivedTracking = function(Text, p3)
			-- upvalues: TimeToInteractiveTracker (upval)
			local Text1 = ("AvatarExperience_" .. Text) .. "_Percieved"
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events == nil or Events[Text1] == nil then return end
			if p3 then
				TimeToInteractiveTracker.updateMetadata(Text1, p3)
			end
			TimeToInteractiveTracker.trackEnd(Text1, nil)
		end,
		updateMetadata = function(Text, p3)
			-- upvalues: TimeToInteractiveTracker (upval)
			local Text1 = "AvatarExperience_" .. Text
			
			if p3 then
				TimeToInteractiveTracker.updateMetadata(Text1, p3)
			end
		end,
		trackMilestone = function(Text, p3, p4)
			-- upvalues: TimeToInteractiveTracker (upval)
			TimeToInteractiveTracker.trackMilestone("AvatarExperience_" .. Text, p3, p4)
		end,
		trackSubphase = function(Text, p3, p4)
			-- upvalues: TimeToInteractiveTracker (upval)
			TimeToInteractiveTracker.trackSubphase("AvatarExperience_" .. Text, p3, p4)
		end,
		trackRequest = function(Text, p3, p4)
			-- upvalues: TimeToInteractiveTracker (upval)
			TimeToInteractiveTracker.trackRequest("AvatarExperience_" .. Text, p3, p4)
		end
	}
end

return {
	Surface = {
		Marketplace = {
			Root = createSurface({
				TTIMetricNamesModule.Marketplace.OrganicTiles,
				TTIMetricNamesModule.Marketplace.OrganicThumbnails,
				TTIMetricNamesModule.Marketplace.WidgetTiles,
				TTIMetricNamesModule.Marketplace.WidgetThumbnails
			})
		},
		AvatarEditor = if FFlagAXTTIEditorEnableMilestones then {
			Root = createSurface({
				TTIMetricNamesModule.Editor.InventoryTiles,
				TTIMetricNamesModule.Editor.InventoryThumbnails
			})
		} else nil
	},
	Milestone = TimeToInteractiveTracker.Milestone,
	TTIMetricNames = TTIMetricNamesModule
}