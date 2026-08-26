local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local experienceTileV3 = UIBloxModule.App.Tile.ExperienceTileV3
local useStyle = UIBloxModule.Core.Style.useStyle
local userLibModule = require(parent.UserLib)
local constants = userLibModule.Utils.Constants
local gameStats = require(parent.GameTile).GameStats
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fFlagProfilePlatformEnableExperiencesFooterModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableExperiencesFooter)
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local _ = require(profilePlatform.Common.Types)
local useSetupImpressionsTileTaggingModule = require(profilePlatform.Hooks.useSetupImpressionsTileTagging)
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local t = {}

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), useSetupImpressionsTileTaggingModule (ref), constants (ref), getRbxthumbWithTypeSizeAndOptions (ref), fFlagProfilePlatformEnableExperiencesFooterModule (ref), useSelector (ref), getDeepValue (ref), t (ref), experienceTileV3 (ref), gameStats (ref)
	local var1 = useStyle()
	local var2 = reactModule.useRef(nil)
	useSetupImpressionsTileTaggingModule(var2, p1.impressionsTag, p1.index)
	local var3 = getRbxthumbWithTypeSizeAndOptions(p1.item.experienceId, constants.RbxthumbTypes.GameIcon, 150)
	local experienceId = nil
	local fFlagProfilePlatformEnableExperiencesFooterModule_1 = p1.showFooter and fFlagProfilePlatformEnableExperiencesFooterModule
	
	if fFlagProfilePlatformEnableExperiencesFooterModule_1 then
		experienceId = useSelector(function(p2)
			-- upvalues: getDeepValue (copy), t (copy)
			return getDeepValue(p2, "GameVotes") or t
		end)[p1.item.experienceId]
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.index,
		Size = UDim2.new(1, 0, 1, 0),
		ref = var2
	}, {
		Tile = reactModule.createElement(experienceTileV3, {
			contextTextLineCount = 1,
			hasBackground = false,
			isHoverEnabled = false,
			hasOutline = false,
			experienceName = p1.item.name,
			thumbnail = var3,
			onActivated = p1.onActivated,
			styleProps = {
				bottomContentPadding = {
					Left = 0,
					Right = 0,
					Top = var1.Tokens.Padding.Small,
					Bottom = var1.Tokens.Padding.Small
				}
			},
			footer = if fFlagProfilePlatformEnableExperiencesFooterModule_1 then reactModule.createElement(gameStats, {
				isGridTile = true,
				stats = {
					totalUpVotes = if experienceId then experienceId.upVotes else 0,
					totalDownVotes = if experienceId then experienceId.downVotes else 0,
					playerCount = p1.item.playing
				}
			}) else nil,
			footerHeight = if fFlagProfilePlatformEnableExperiencesFooterModule_1 then 32 else nil
		})
	})
end