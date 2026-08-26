local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local dataStatus = require(parent.DataHydration).DataStatus
local buttonTypes = require(parent.UserList).Enums.ButtonTypes
local mapProfileCTAToRowCTAModule = require(socialTabsPage.Utils.mapProfileCTAToRowCTA)
local _ = require(socialTabsPage.Common.Types)

local var1 = function()
	return nil
end

return function(p1, p2, p3, p4)
	-- upvalues: var1 (ref), useSignalState (ref), reactModule (ref), dataStatus (ref), mapProfileCTAToRowCTAModule (ref), buttonTypes (ref)
	local var2 = useSignalState(if p1 then p1.data else var1)
	local var3 = useSignalState(if p1 then p1.status else var1)
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), dataStatus (copy), mapProfileCTAToRowCTAModule (copy), var2 (ref), p2 (ref), p3 (ref), buttonTypes (copy), p4 (ref)
		if var3 == dataStatus.NotReady then
			return nil
		end
		local var4 = mapProfileCTAToRowCTAModule(var2, p2, p3)
		
		if var4 and var4.type == buttonTypes.Join and p4 then
			local onActivated = var4.onActivated
			
			return {
				type = var4.type,
				onActivated = function()
					-- upvalues: onActivated (ref), p4 (copy)
					if onActivated then
						onActivated()
					end
					p4.joinExperience()
				end,
				isDisabled = not p4.isInExperience,
				isLoading = p4.isLoading
			}
		end
		return var4
	end, {
		var2,
		var3,
		p2,
		p3,
		p4
	})
end