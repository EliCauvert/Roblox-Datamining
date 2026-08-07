local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local dataStatus = require(parent.DataHydration).DataStatus
local buttonTypes = require(parent.UserList).Enums.ButtonTypes
local mapProfileCTAToRowCTAModule = require(socialTabsPage.Utils.mapProfileCTAToRowCTA)
local _ = require(socialTabsPage.Common.Types)

local var3 = function() --[[ line: 27 ]]
	return nil
end

return function(p0, p1, p2, p3) --[[ line: 31 | named "useCTAForRow" ]]
	-- upvalues: var3 (ref), useSignalState (ref), reactModule (ref), dataStatus (ref), mapProfileCTAToRowCTAModule (ref), buttonTypes (ref)
	local var4 = useSignalState(if p0 then p0.data else var3)
	local var5 = useSignalState(if p0 then p0.status else var3)
	
	return reactModule.useMemo(function() --[[ line: 43 ]]
		-- upvalues: var5 (ref), dataStatus (copy), mapProfileCTAToRowCTAModule (copy), var4 (ref), p1 (ref), p2 (ref), buttonTypes (copy), p3 (ref)
		if var5 == dataStatus.NotReady then
			return nil
		end
		local var6 = mapProfileCTAToRowCTAModule(var4, p1, p2)
		
		if var6 and var6.type == buttonTypes.Join and p3 then
			local onActivated = var6.onActivated
			
			return {
				type = var6.type,
				onActivated = function() --[[ line: 54 ]]
					-- upvalues: onActivated (ref), p3 (copy)
					if onActivated then
						onActivated()
					end
					p3.joinExperience()
				end,
				isDisabled = not p3.isInExperience,
				isLoading = p3.isLoading
			}
		end
		return var6
	end, {
		var4,
		var5,
		p1,
		p2,
		p3
	})
end