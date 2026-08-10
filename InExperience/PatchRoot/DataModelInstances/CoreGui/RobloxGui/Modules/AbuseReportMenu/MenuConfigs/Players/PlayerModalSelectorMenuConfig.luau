local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local verifiedBadgesModule = require(corePackagesService.Workspace.Packages.VerifiedBadges)
local userLibModule = require(corePackagesService.Workspace.Packages.UserLib)
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local inExperienceCapabilities = require(corePackagesService.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities

return {
	componentType = "modalSelector",
	fieldLabel = "WhichPerson",
	componentName = "PlayerSelector",
	getIsVisible = function(_) --[[ line: 13 ]]
		return true
	end,
	getMenuItems = function(p0) --[[ line: 16 ]]
		-- upvalues: cryoModule (ref), userLibModule (ref), verifiedBadgesModule (ref), inExperienceCapabilities (ref)
		return cryoModule.List.map(p0.playerObjects, function(p1) --[[ line: 17 ]]
			-- upvalues: userLibModule (copy), verifiedBadgesModule (copy), inExperienceCapabilities (copy)
			return {
				label = p1.DisplayName .. (if userLibModule.Utils.isPlayerVerified(p1) then verifiedBadgesModule.emoji.verified else ""),
				subLabel = if inExperienceCapabilities.canDisplayPeoplesUsernames then "[@" .. p1.Name .. "]" else nil,
				identifier = p1.Name
			}
		end)
	end,
	getSelectedValue = function(p2) --[[ line: 31 ]]
		-- upvalues: inExperienceCapabilities (ref)
		local allegedAbuser = p2.allegedAbuser
		
		return if allegedAbuser then allegedAbuser.DisplayName .. (if inExperienceCapabilities.canDisplayPeoplesUsernames then "[@" .. allegedAbuser.Name .. "]" else "") else nil
	end,
	onUpdateSelectedOption = function(p3, p4, p5, p6) --[[ line: 42 ]]
		-- upvalues: constantsModule (ref)
		if p3.identifier then
			local identifier = p3.identifier
			
			for i, v in p4.playerObjects do
				if identifier == v.Name then
					local userId = v.UserId
					p6.analyticsDispatch({
						type = constantsModule.AnalyticsActions.IncrementPersonChanged
					})
					p5({
						type = constantsModule.PlayerMenuActions.UpdateAbuser,
						abuseId = userId,
						abuser = v
					})
				end
			end
		end
	end
}