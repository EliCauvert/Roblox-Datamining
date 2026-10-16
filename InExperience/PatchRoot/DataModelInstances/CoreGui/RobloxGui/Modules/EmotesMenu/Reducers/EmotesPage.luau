local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Actions = script.Parent.Parent.Actions

local function createCurrentEmotes(Emotes, EquippedEmotes) --[[ Line: 24 ]]
	local Names = {}
	
	for _, equippedEmote in ipairs(EquippedEmotes) do
		local Slot = equippedEmote.Slot
		local Name = equippedEmote.Name
		
		if Slot and Name and Emotes[Name] then
			Names[Slot] = Name
		end
	end
	return Names
end

return require(CorePackages.Packages.Rodux).createReducer({
	numberEmotesLoaded = -1,
	emotesInfo = {},
	equippedEmotes = {},
	currentEmotes = {}
}, {
	[require(Actions.EmotesChanged).name] = function(p1, p2) --[[ Line: 42 ]]
		-- upvalues: CryoModule (copy), createCurrentEmotes (copy)
		return CryoModule.Dictionary.join(p1, {
			emotesInfo = p2.emotes,
			currentEmotes = createCurrentEmotes(p2.emotes, p1.equippedEmotes)
		})
	end,
	[require(Actions.EquippedEmotesChanged).name] = function(p1, p2) --[[ Line: 49 ]]
		-- upvalues: CryoModule (copy), createCurrentEmotes (copy)
		return CryoModule.Dictionary.join(p1, {
			equippedEmotes = p2.equippedEmotes,
			currentEmotes = createCurrentEmotes(p1.emotesInfo, p2.equippedEmotes)
		})
	end,
	[require(Actions.NumberEmotesLoadedChanged).name] = function(p1, p2) --[[ Line: 56 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { numberEmotesLoaded = p2.numberEmotesLoaded })
	end
})