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

return function(p1, p2, _)
	-- upvalues: useDispatch (ref), useNavigation (ref), useStyle (ref), reactModule (ref), openGameDetails (ref), constants (ref), getRbxthumbWithTypeSizeAndOptions (ref), experienceTileV3 (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useStyle()
	p1 = p1 or "ProfileExperienceTile_"
	
	return reactModule.useCallback(function(p3, p4, _, p5)
		-- upvalues: p2 (ref), var1 (ref), openGameDetails (copy), var2 (ref), constants (copy), getRbxthumbWithTypeSizeAndOptions (copy), reactModule (copy), experienceTileV3 (copy), var3 (ref), p1 (write)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p4,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Tile = reactModule.createElement(experienceTileV3, {
				contextTextLineCount = 1,
				hasBackground = false,
				isHoverEnabled = false,
				hasOutline = false,
				experienceName = p3.name,
				thumbnail = getRbxthumbWithTypeSizeAndOptions(p3.experienceId, constants.RbxthumbTypes.GameIcon, 150),
				onActivated = function()
					-- upvalues: p2 (copy), p3 (ref), p4 (ref), p5 (ref), var1 (copy), openGameDetails (copy), var2 (copy)
					if p2 then
						p2(p3, p4, p5)
					end
					var1(openGameDetails(p3.experienceId, var2, { mountAsFullView = false, showBackButton = true }))
				end,
				styleProps = {
					bottomContentPadding = {
						Left = 0,
						Right = 0,
						Top = var3.Tokens.Padding.Small,
						Bottom = var3.Tokens.Padding.Small
					}
				}
			})
		}), `{p1}{p3.experienceId}_`
	end, {
		var1,
		var2,
		if fFlagRenameDeprecatedUIBloxTokens then var3.Tokens.Padding.Small else var3.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing,
		p2,
		p1
	})
end