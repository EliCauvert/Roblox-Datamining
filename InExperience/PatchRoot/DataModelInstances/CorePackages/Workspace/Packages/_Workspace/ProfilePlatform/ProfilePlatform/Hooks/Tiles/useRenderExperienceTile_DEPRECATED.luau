local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local UIBloxModule = require(Parent.UIBlox)
local ExperienceTileV3 = UIBloxModule.App.Tile.ExperienceTileV3
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UserLibModule = require(Parent.UserLib)
local Constants = UserLibModule.Utils.Constants
local _ = require(ProfilePlatform.Common.Types)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions

return function(p1, Callback, _) --[[ Line: 27 | Named "useRenderSquareExperienceTile" ]]
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseStyleFunction (copy), ReactModule (copy), OpenGameDetailsFunction (copy), Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ExperienceTileV3 (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResult = UseStyleFunction()
	local P0 = p1 or "ProfileExperienceTile_"
	
	return (ReactModule.useCallback(function(p2, LayoutOrder, _, p3) --[[ Line: 44 ]]
		-- upvalues: Callback (copy), UseDispatchResult (copy), OpenGameDetailsFunction (upval), UseNavigationResult (copy), Constants (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), ReactModule (upval), ExperienceTileV3 (upval), UseStyleResult (copy), P0 (ref)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Tile = ReactModule.createElement(ExperienceTileV3, {
				contextTextLineCount = 1,
				hasBackground = false,
				isHoverEnabled = false,
				hasOutline = false,
				experienceName = p2.name,
				thumbnail = GetRbxthumbWithTypeSizeAndOptionsFunction(p2.experienceId, Constants.RbxthumbTypes.GameIcon, 150),
				onActivated = function() --[[ Line: 45 ]]
					-- upvalues: Callback (upval), p2 (copy), LayoutOrder (copy), p3 (copy), UseDispatchResult (upval), OpenGameDetailsFunction (upval), UseNavigationResult (upval)
					if Callback then
						Callback(p2, LayoutOrder, p3)
					end
					UseDispatchResult(OpenGameDetailsFunction(p2.experienceId, UseNavigationResult, { mountAsFullView = false, showBackButton = true }))
				end,
				styleProps = {
					bottomContentPadding = {
						Left = 0,
						Right = 0,
						Top = UseStyleResult.Tokens.Padding.Small,
						Bottom = UseStyleResult.Tokens.Padding.Small
					}
				}
			})
		}), `{P0}{p2.experienceId}_`
	end, {
		UseDispatchResult,
		UseNavigationResult,
		UseStyleResult.Tokens.Padding.Small,
		Callback,
		P0
	}))
end