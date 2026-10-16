local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local _ = require(SocialUpsell.Analytics.Enum.UpsellEntrySurfaceType)
local _ = require(SocialUpsell.Enum.SocialUpsellType)
local _ = require(SocialUpsell.Types)
local v1 = nil

local function createUpsellSignalStore() --[[ Line: 37 ]]
	-- upvalues: SignalsModule (copy), CryoModule (copy)
	local t = {}
	
	local function _(Key) --[[ Line: 40 | Named "getOrCreateUpsellBannerDataStore" ]]
		-- upvalues: t (copy), SignalsModule (upval)
		local Entry = t[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			Entry = { getBannerData = Signal, setBannerData = Signal2 }
			t[Key] = Entry
		end
		return Entry
	end
	
	return {
		getUpsellBannerDataGetter = function(Key) --[[ Line: 53 ]]
			-- upvalues: t (copy), SignalsModule (upval)
			local Entry = t[Key]
			
			if Entry == nil then
				local Signal, Signal2 = SignalsModule.createSignal(nil)
				Entry = { getBannerData = Signal, setBannerData = Signal2 }
				t[Key] = Entry
			end
			return Entry.getBannerData
		end,
		setUpsellBannerData = function(Key, p1, p2) --[[ Line: 57 ]]
			-- upvalues: t (copy), SignalsModule (upval), CryoModule (upval)
			local Entry = t[Key]
			
			if Entry == nil then
				local Signal, Signal2 = SignalsModule.createSignal(nil)
				Entry = { getBannerData = Signal, setBannerData = Signal2 }
				t[Key] = Entry
			end
			Entry.setBannerData(function(p3) --[[ Line: 62 ]]
				-- upvalues: p2 (copy), CryoModule (upval), p1 (copy)
				local JoinResult = CryoModule.Dictionary.join(p3 or {}, {
					[p1] = if p2 == nil then CryoModule.None else { isVisible = true }
				})
				
				return if next(JoinResult) == nil then nil else JoinResult
			end)
		end
	}
end

return function() --[[ Line: 75 ]]
	-- upvalues: v1 (ref), SignalsModule (copy), createUpsellSignalStore (copy)
	if v1 == nil then
		v1 = SignalsModule.createComputed(createUpsellSignalStore)(false)
	end
	return v1
end