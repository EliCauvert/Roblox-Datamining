local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local DataStatus = require(Parent.DataHydration).DataStatus
local ButtonTypes = require(Parent.UserList).Enums.ButtonTypes
local MapProfileCTAToRowCTAModule = require(SocialTabsPage.Utils.mapProfileCTAToRowCTA)
local _ = require(SocialTabsPage.Common.Types)

local function v7()
	return nil
end

return function(p1, p2, p3, p4)
	-- upvalues: v7 (copy), UseSignalStateFunction (copy), ReactModule (copy), DataStatus (copy), MapProfileCTAToRowCTAModule (copy), ButtonTypes (copy)
	local UseSignalStateResult = UseSignalStateFunction(if p1 then p1.data else v7)
	local UseSignalStateResult1 = UseSignalStateFunction(if p1 then p1.status else v7)
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult1 (copy), DataStatus (upval), MapProfileCTAToRowCTAModule (upval), UseSignalStateResult (copy), p2 (copy), p3 (copy), ButtonTypes (upval), p4 (copy)
		if UseSignalStateResult1 == DataStatus.NotReady then
			return nil
		end
		local MapProfileCTAToRowCTAModuleResult = MapProfileCTAToRowCTAModule(UseSignalStateResult, p2, p3)
		
		if MapProfileCTAToRowCTAModuleResult and MapProfileCTAToRowCTAModuleResult.type == ButtonTypes.Join and p4 then
			local OnActivatedFunction = MapProfileCTAToRowCTAModuleResult.onActivated
			
			return {
				type = MapProfileCTAToRowCTAModuleResult.type,
				onActivated = function()
					-- upvalues: OnActivatedFunction (copy), p4 (upval)
					if OnActivatedFunction then
						OnActivatedFunction()
					end
					p4.joinExperience()
				end,
				isDisabled = not p4.isInExperience,
				isLoading = p4.isLoading
			}
		else
			return MapProfileCTAToRowCTAModuleResult
		end
	end, {
		UseSignalStateResult,
		UseSignalStateResult1,
		p2,
		p3,
		p4
	})
end