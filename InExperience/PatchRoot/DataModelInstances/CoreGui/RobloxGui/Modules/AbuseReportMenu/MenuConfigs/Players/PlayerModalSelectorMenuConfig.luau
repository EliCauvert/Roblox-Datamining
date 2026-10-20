local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local _ = require(AbuseReportMenu.Components.Types)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local InExperienceCapabilities = require(CorePackages.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities

return {
	componentType = "modalSelector",
	fieldLabel = "WhichPerson",
	componentName = "PlayerSelector",
	getIsVisible = function(_): boolean
		return true
	end,
	getMenuItems = function(p1)
		-- upvalues: CryoModule (copy), UserLibModule (copy), VerifiedBadgesModule (copy), InExperienceCapabilities (copy)
		return (CryoModule.List.map(p1.playerObjects, function(Player)
			-- upvalues: UserLibModule (upval), VerifiedBadgesModule (upval), InExperienceCapabilities (upval)
			return {
				label = Player.DisplayName .. (if UserLibModule.Utils.isPlayerVerified(Player) then VerifiedBadgesModule.emoji.verified else ""),
				subLabel = if InExperienceCapabilities.canDisplayPeoplesUsernames then "[@" .. Player.Name .. "]" else nil,
				identifier = Player.Name
			}
		end))
	end,
	getSelectedValue = function(p1): string?
		-- upvalues: InExperienceCapabilities (copy)
		local AllegedAbuser = p1.allegedAbuser
		
		if AllegedAbuser then
			local Name = AllegedAbuser.Name
			
			return AllegedAbuser.DisplayName .. (if InExperienceCapabilities.canDisplayPeoplesUsernames then "[@" .. Name .. "]" else "")
		else
			return nil
		end
	end,
	onUpdateSelectedOption = function(p1, p2, Callback: (any) -> (), p3)
		-- upvalues: ConstantsModule (copy)
		if p1.identifier then
			local Identifier = p1.identifier
			
			for _, playerObject in p2.playerObjects do
				if Identifier == playerObject.Name then
					local UserId = playerObject.UserId
					p3.analyticsDispatch({
						type = ConstantsModule.AnalyticsActions.IncrementPersonChanged
					})
					Callback({
						type = ConstantsModule.PlayerMenuActions.UpdateAbuser,
						abuseId = UserId,
						abuser = playerObject
					})
				end
			end
		end
	end
}