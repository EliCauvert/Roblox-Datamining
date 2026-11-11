local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UsePlayerCountTextFunction = require(CorePackages.Workspace.Packages.GameTile).usePlayerCountText
local OpenGameDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenGameDetails)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SetItemDetailsExpandedModule = require(Modules.AvatarExperience.Common.Actions.SetItemDetailsExpanded)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local GameStats = require(CorePackages.Workspace.Packages.GameTile).GameStats
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local GetFFlagAXRevisedExperienceTileModule = require(Modules.AvatarExperience.Flags.GetFFlagAXRevisedExperienceTile)

local function _(p1, p2): string
	return if p1 + p2 == 0 then "--" else `{math.round(p1 / (p1 + p2) * 100)}%`
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseStyleFunction (copy), ReactModule (copy), UsePlayerCountTextFunction (copy), GetIconSizeFunction (copy), IconSize (copy), UseSelectorFunction (copy), DeviceOrientationMode (copy), GetUseSelectorDeepEqualsFunction (copy), SetItemDetailsExpandedModule (copy), AvatarScreen (copy), OpenGameDetailsModule (copy), ImageSetLabel (copy), Images (copy), LoadableImage (copy), Skeleton (copy), GetFFlagAXRevisedExperienceTileModule (copy), GameStats (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local Text = nil
	
	if p1.isHydrated and p1.totalDownVotes and p1.totalUpVotes then
		local TotalUpVotes = p1.totalUpVotes
		local TotalDownVotes = p1.totalDownVotes
		Text = if TotalUpVotes + TotalDownVotes == 0 then "--" else `{math.round(TotalUpVotes / (TotalUpVotes + TotalDownVotes) * 100)}%`
	else
		Text = "--"
	end
	local UsePlayerCountTextResult = UsePlayerCountTextFunction(p1.isHydrated and p1.playerCount or nil)
	local Ceiled = math.ceil(UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize * 2)
	local Ceiled1 = math.ceil(UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize)
	local IconSize1 = GetIconSizeFunction(IconSize.Small)
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
	local UseStateResult, UseStateResult2 = ReactModule.useState(1)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		local Current = UseRefResult.current
		
		if not Current or not Current.AbsoluteSize then return end
		local X: number = Current.AbsoluteSize.X
		
		if X < 100 then
			UseStateResult2(0.7)
			
			return
		end
		if X < 120 then
			UseStateResult2(0.8)
			
			return
		end
		if X < 140 then
			UseStateResult2(0.9)
			
			return
		else
			UseStateResult2(1)
		end
	end, {
		p1.isHydrated,
		UseSelectorFunction(function(p2): boolean
			-- upvalues: DeviceOrientationMode (upval)
			return p2.DeviceOrientation == DeviceOrientationMode.Portrait
		end, GetUseSelectorDeepEqualsFunction()),
		UseRefResult
	})
	
	local function renderFooterRow()
		-- upvalues: p1 (copy), UseStyleResult (copy), IconSize1 (copy), UseStateResult (copy), ReactModule (upval), Ceiled1 (copy), ImageSetLabel (upval), Images (upval), Text (copy), ScaledBaseSize (copy), UsePlayerCountTextResult (copy)
		if p1.isHydrated then
			local Theme = UseStyleResult.Theme
			local UseStyleResultFont = UseStyleResult.Font
			local _UDim2 = UDim2.fromOffset(IconSize1 * UseStateResult, IconSize1 * UseStateResult)
			local _UDim2_1 = UDim2.fromOffset(IconSize1 * UseStateResult + 4, 0)
			
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, Ceiled1)
			}, {
				RatingStats = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Position = UDim2.fromScale(0, 0),
					Size = UDim2.fromScale(0.5, 1)
				}, {
					Icon = ReactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = _UDim2,
						Image = Images["icons/status/games/rating_small"],
						ImageTransparency = Theme.IconDefault.Transparency,
						ImageColor3 = Theme.IconDefault.Color
					}),
					Text = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.Y,
						Font = UseStyleResultFont.Body.Font,
						Position = _UDim2_1,
						Text = Text,
						TextSize = ScaledBaseSize * UseStateResult,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						TextColor3 = Theme.TextMuted.Color,
						TextTransparency = Theme.TextMuted.Transparency
					})
				}),
				PlayingStats = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY,
					Position = UDim2.new(0.5, 4, 0, 0),
					Size = UDim2.fromScale(0.5, 1)
				}, {
					Icon = ReactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = _UDim2,
						Image = Images["icons/status/games/people-playing_small"],
						ImageTransparency = Theme.IconDefault.Transparency,
						ImageColor3 = Theme.IconDefault.Color
					}),
					Text = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.Y,
						Font = UseStyleResultFont.Body.Font,
						Position = _UDim2_1,
						Text = UsePlayerCountTextResult,
						TextSize = ScaledBaseSize * UseStateResult,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						TextColor3 = Theme.TextMuted.Color,
						TextTransparency = Theme.TextMuted.Transparency
					})
				})
			})
		else
			return nil
		end
	end
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.index,
		Size = UDim2.new(1, 0, 0, 0),
		ref = UseRefResult
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, 8)
		}),
		ImageButton = ReactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Image = nil,
			Size = UDim2.fromScale(1, 1),
			[ReactModule.Event.Activated] = function()
				-- upvalues: UseDispatchResult (copy), SetItemDetailsExpandedModule (upval), UseNavigationResult (copy), AvatarScreen (upval), OpenGameDetailsModule (upval), p1 (copy)
				UseDispatchResult(OpenGameDetailsModule(p1.universeId, UseNavigationResult, {
					onClose = function()
						-- upvalues: UseDispatchResult (upval), SetItemDetailsExpandedModule (upval), UseNavigationResult (upval), AvatarScreen (upval)
						UseDispatchResult(SetItemDetailsExpandedModule(false))
						UseNavigationResult.navigate(AvatarScreen.Catalog)
					end
				}))
			end
		}, {
			Image = ReactModule.createElement(LoadableImage, {
				BackgroundTransparency = 1,
				Image = `rbxthumb://type=GameIcon&id={p1.universeId}&w={150}&h={150}`,
				Size = UDim2.fromScale(1, 1),
				cornerRadius = UDim.new(0, 12)
			}),
			UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 })
		}),
		TitleShimmer = if p1.isHydrated then nil else ReactModule.createElement(Skeleton, { LayoutOrder = 1, Size = UDim2.new(1, 0, 0, Ceiled) }),
		Title = if p1.isHydrated then ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Font = UseStyleResultFont.Header2.Font,
			Text = p1.name,
			TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize,
			TextColor3 = Theme.TextEmphasis.Color,
			TextTransparency = Theme.TextEmphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			Size = UDim2.new(1, 0, 0, Ceiled)
		}) else nil,
		FooterShimmer = if p1.isHydrated then nil else ReactModule.createElement(Skeleton, { LayoutOrder = 2, Size = UDim2.new(1, 0, 0, Ceiled1) }),
		Footer = if p1.isHydrated then if GetFFlagAXRevisedExperienceTileModule() then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, 22) }),
			Footer = ReactModule.createElement(GameStats, {
				stats = {
					playerCount = p1.playerCount,
					totalUpVotes = p1.totalUpVotes,
					totalDownVotes = p1.totalDownVotes
				}
			})
		}) else renderFooterRow() else nil
	})
end