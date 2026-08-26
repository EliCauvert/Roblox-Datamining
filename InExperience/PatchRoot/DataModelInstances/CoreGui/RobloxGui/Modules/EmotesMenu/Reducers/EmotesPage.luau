local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local actions = script.Parent.Parent.Actions

local function createCurrentEmotes(p1, p2)
	local t = {}
	
	for i, v in ipairs(p2) do
		local slot = v.Slot
		local name = v.Name
		
		if slot and name and p1[name] then
			t[slot] = name
		end
	end
	return t
end

return roduxModule.createReducer({
	numberEmotesLoaded = -1,
	emotesInfo = {},
	equippedEmotes = {},
	currentEmotes = {}
}, {
	[require(actions.EmotesChanged).name] = function(p3, p4)
		-- upvalues: cryoModule (ref), createCurrentEmotes (ref)
		return cryoModule.Dictionary.join(p3, {
			emotesInfo = p4.emotes,
			currentEmotes = createCurrentEmotes(p4.emotes, p3.equippedEmotes)
		})
	end,
	[require(actions.EquippedEmotesChanged).name] = function(p3, p4)
		-- upvalues: cryoModule (ref), createCurrentEmotes (ref)
		return cryoModule.Dictionary.join(p3, {
			equippedEmotes = p4.equippedEmotes,
			currentEmotes = createCurrentEmotes(p3.emotesInfo, p4.equippedEmotes)
		})
	end,
	[require(actions.NumberEmotesLoadedChanged).name] = function(p3, p4)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p3, { numberEmotesLoaded = p4.numberEmotesLoaded })
	end
})