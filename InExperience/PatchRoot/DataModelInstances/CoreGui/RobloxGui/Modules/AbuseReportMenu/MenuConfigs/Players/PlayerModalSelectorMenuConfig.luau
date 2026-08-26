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
	getIsVisible = function(_)
		return true
	end,
	getMenuItems = function(p1)
		-- upvalues: cryoModule (ref), userLibModule (ref), verifiedBadgesModule (ref), inExperienceCapabilities (ref)
		return cryoModule.List.map(p1.playerObjects, function(p2)
			-- upvalues: userLibModule (copy), verifiedBadgesModule (copy), inExperienceCapabilities (copy)
			return {
				label = p2.DisplayName .. (if userLibModule.Utils.isPlayerVerified(p2) then verifiedBadgesModule.emoji.verified else ""),
				subLabel = if inExperienceCapabilities.canDisplayPeoplesUsernames then "[@" .. p1.Name .. "]" else nil,
				identifier = p2.Name
			}
		end)
	end,
	getSelectedValue = function(p1)
		-- upvalues: inExperienceCapabilities (ref)
		local allegedAbuser = p1.allegedAbuser
		
		return if allegedAbuser then allegedAbuser.DisplayName .. (if inExperienceCapabilities.canDisplayPeoplesUsernames then "[@" .. allegedAbuser.Name .. "]" else "") else nil
	end,
	onUpdateSelectedOption = function(p1, p2, p3, p4)
		-- upvalues: constantsModule (ref)
		if p1.identifier then
			local identifier = p1.identifier
			
			for i, v in p2.playerObjects do
				if identifier == v.Name then
					local userId = v.UserId
					p4.analyticsDispatch({
						type = constantsModule.AnalyticsActions.IncrementPersonChanged
					})
					p3({
						type = constantsModule.PlayerMenuActions.UpdateAbuser,
						abuseId = userId,
						abuser = v
					})
				end
			end
		end
	end
}