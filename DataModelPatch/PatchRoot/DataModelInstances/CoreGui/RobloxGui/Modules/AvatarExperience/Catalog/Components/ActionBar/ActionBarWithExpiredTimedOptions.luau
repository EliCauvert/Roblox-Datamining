local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ActionButtonModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Components.ActionBar.ActionButton)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle

function ActionBarWithExpiredTimedOptions(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), UseStyleFunction (copy), ReactModule (copy), Text (copy), ActionButtonModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		expiredItemsPlural = {
			"Feature.Durables.BottomBar.Repurchase.ExpiredItemsPlural",
			number = p1.expiredItemCount
		},
		expiredItemsSingular = {
			"Feature.Durables.BottomBar.Repurchase.ExpiredItemsSingular",
			number = p1.expiredItemCount
		}
	})
	local config = {
		ExpiredLabel = ReactModule.createElement(Text, {
			tag = "text-title-large content-emphasis auto-xy anchor-center-left",
			LayoutOrder = 1,
			Position = UDim2.new(0, UseTokensResult.Size.Size_200, 0.5, 0),
			Text = if p1.expiredItemCount == 1 then UseLocalizationResult.expiredItemsSingular else UseLocalizationResult.expiredItemsPlural
		}),
		ActionButton = ReactModule.createElement(ActionButtonModule, {
			LayoutOrder = 2,
			Size = UDim2.new(0.5, -UseTokensResult.Size.Size_250, 0, UseTokensResult.Size.Size_1000),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -UseTokensResult.Size.Size_200, 0.5, 0),
			Font = UseStyleFunction().Font,
			buttonProps = {
				buttonText = "View",
				buttonIcon = nil,
				buttonIconPadding = 0,
				buttonIconSize = 0,
				buttonIsDisabled = false,
				buttonIsLoading = false,
				buttonColor = UseTokensResult.Color.ActionEmphasis.Background.Color3,
				buttonTextColor = UseTokensResult.Color.ActionEmphasis.Foreground.Color3,
				onActivated = p1.onViewPressed
			}
		})
	}
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 anchor-bottom-left",
		ZIndex = 3,
		Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1500),
		Position = UDim2.new(0, 0, 1, 0)
	}, {
		TopBorder = ReactModule.createElement(View, {
			ZIndex = 2,
			backgroundStyle = UseTokensResult.Color.Stroke.Default,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 0, -1)
		}),
		ActionBarFrame = ReactModule.createElement(View, {
			tag = "bg-surface-0 padding-y-small padding-x-small",
			Size = UDim2.fromScale(1, 1)
		}, {
			ExpiredLabel = config.ExpiredLabel,
			ActionButton = config.ActionButton
		})
	})
end

return ActionBarWithExpiredTimedOptions