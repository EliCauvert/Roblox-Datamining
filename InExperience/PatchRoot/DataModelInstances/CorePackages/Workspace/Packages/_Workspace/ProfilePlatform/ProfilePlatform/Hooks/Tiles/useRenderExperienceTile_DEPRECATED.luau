local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local openGameDetails = require(parent.GameDetail).OpenGameDetails
local UIBloxModule = require(parent.UIBlox)
local experienceTileV3 = UIBloxModule.App.Tile.ExperienceTileV3
local useStyle = UIBloxModule.Core.Style.useStyle
local userLibModule = require(parent.UserLib)
local constants = userLibModule.Utils.Constants
local _ = require(profilePlatform.Common.Types)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions

return function(p0, p1, _)
	-- upvalues: useDispatch (ref), useNavigation (ref), useStyle (ref), reactModule (ref), openGameDetails (ref), constants (ref), getRbxthumbWithTypeSizeAndOptions (ref), experienceTileV3 (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	local var4 = useDispatch()
	local var5 = useNavigation()
	local var6 = useStyle()
	p0 = p0 or "ProfileExperienceTile_"
	
	return reactModule.useCallback(function(p2, p3, _, p4)
		-- upvalues: p1 (ref), var4 (ref), openGameDetails (copy), var5 (ref), constants (copy), getRbxthumbWithTypeSizeAndOptions (copy), reactModule (copy), experienceTileV3 (copy), var6 (ref), p0 (write)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p3,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Tile = reactModule.createElement(experienceTileV3, {
				contextTextLineCount = 1,
				hasBackground = false,
				isHoverEnabled = false,
				hasOutline = false,
				experienceName = p2.name,
				thumbnail = getRbxthumbWithTypeSizeAndOptions(p2.experienceId, constants.RbxthumbTypes.GameIcon, 150),
				onActivated = function()
					-- upvalues: p1 (copy), p2 (ref), p3 (ref), p4 (ref), var4 (copy), openGameDetails (copy), var5 (copy)
					if p1 then
						p1(p2, p3, p4)
					end
					var4(openGameDetails(p2.experienceId, var5, { mountAsFullView = false, showBackButton = true }))
				end,
				styleProps = {
					bottomContentPadding = {
						Left = 0,
						Right = 0,
						Top = var6.Tokens.Padding.Small,
						Bottom = var6.Tokens.Padding.Small
					}
				}
			})
		}), `{p0}{p2.experienceId}_`
	end, {
		var4,
		var5,
		if fFlagRenameDeprecatedUIBloxTokens then var6.Tokens.Padding.Small else var6.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing,
		p1,
		p0
	})
end