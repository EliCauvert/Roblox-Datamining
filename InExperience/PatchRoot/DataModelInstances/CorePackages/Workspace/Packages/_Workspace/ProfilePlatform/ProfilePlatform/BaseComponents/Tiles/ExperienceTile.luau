local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ExperienceTileV3 = UIBloxModule.App.Tile.ExperienceTileV3
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UserLibModule = require(Parent.UserLib)
local Constants = UserLibModule.Utils.Constants
local GameStats = require(Parent.GameTile).GameStats
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagProfilePlatformEnableExperiencesFooterModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableExperiencesFooter)
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local _ = require(ProfilePlatform.Common.Types)
local UseSetupImpressionsTileTaggingModule = require(ProfilePlatform.Hooks.useSetupImpressionsTileTagging)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local t = {}

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), UseSetupImpressionsTileTaggingModule (copy), Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), FFlagProfilePlatformEnableExperiencesFooterModule (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), t (copy), ExperienceTileV3 (copy), GameStats (copy)
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	UseSetupImpressionsTileTaggingModule(UseRefResult, p1.impressionsTag, p1.index)
	local RbxthumbWithTypeSizeAndOptions = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.item.experienceId, Constants.RbxthumbTypes.GameIcon, 150)
	local v1 = nil
	local FFlagProfilePlatformEnableExperiencesFooterModule1 = p1.showFooter and FFlagProfilePlatformEnableExperiencesFooterModule
	
	if FFlagProfilePlatformEnableExperiencesFooterModule1 then
		v1 = UseSelectorFunction(function(p2)
			-- upvalues: GetDeepValueFunction (upval), t (upval)
			return GetDeepValueFunction(p2, "GameVotes") or t
		end)[p1.item.experienceId]
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.index,
		Size = UDim2.new(1, 0, 1, 0),
		ref = UseRefResult
	}, {
		Tile = ReactModule.createElement(ExperienceTileV3, {
			contextTextLineCount = 1,
			hasBackground = false,
			isHoverEnabled = false,
			hasOutline = false,
			experienceName = p1.item.name,
			thumbnail = RbxthumbWithTypeSizeAndOptions,
			onActivated = p1.onActivated,
			styleProps = {
				bottomContentPadding = {
					Left = 0,
					Right = 0,
					Top = UseStyleResult.Tokens.Padding.Small,
					Bottom = UseStyleResult.Tokens.Padding.Small
				}
			},
			footer = if FFlagProfilePlatformEnableExperiencesFooterModule1 then ReactModule.createElement(GameStats, {
				isGridTile = true,
				stats = {
					totalUpVotes = v1 and v1.upVotes or 0,
					totalDownVotes = v1 and v1.downVotes or 0,
					playerCount = p1.item.playing
				}
			}) else nil,
			footerHeight = if FFlagProfilePlatformEnableExperiencesFooterModule1 then 32 else nil
		})
	})
end