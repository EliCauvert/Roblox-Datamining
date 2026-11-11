local AppStorageService = game:GetService("AppStorageService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local Tokens = require(CorePackages.Packages.UIBlox).App.Style.Tokens
local GetThemeModuleForStringModule = require(Modules.LuaApp.Themes.getThemeModuleForString)
local ThemeContextDEPRECATEDModule = require(Modules.LuaApp.ThemeContext_DEPRECATED)
local ThemeProvider = RoactModule.Component:extend("ThemeProvider")

local function v9(Tbl, FoundationTokensDefaultScale)
	local Copy = table.clone(Tbl)
	Copy.ContextPrimaryButton.Color = FoundationTokensDefaultScale.Color.ActionEmphasis.Background.Color3
	Copy.ContextPrimaryButton.Transparency = FoundationTokensDefaultScale.Color.ActionEmphasis.Background.Transparency
	Copy.ContextPrimaryButton.Text.Color = FoundationTokensDefaultScale.Color.ActionEmphasis.Foreground.Color3
	Copy.ContextPrimaryButton.Text.Transparency = FoundationTokensDefaultScale.Color.ActionEmphasis.Foreground.Transparency
	Copy.SecondaryButton.Color = FoundationTokensDefaultScale.Color.ActionSubtle.Background.Color3
	Copy.SecondaryButton.Transparency = FoundationTokensDefaultScale.Color.ActionSubtle.Background.Transparency
	Copy.SecondaryButton.DisabledColor = FoundationTokensDefaultScale.Color.ActionSubtle.Background.Color3
	Copy.SecondaryButton.DisabledTransparency = 0.5
	Copy.SecondaryButton.OnPressColor = FoundationTokensDefaultScale.Color.ActionSubtle.Background.Color3
	Copy.SecondaryButton.OnPressTransparency = 0.5
	Copy.SecondaryButton.Text.Color = FoundationTokensDefaultScale.Color.ActionSubtle.Foreground.Color3
	Copy.SecondaryButton.Text.Transparency = FoundationTokensDefaultScale.Color.ActionSubtle.Foreground.Transparency
	Copy.SecondaryButton.Border.Color = FoundationTokensDefaultScale.Color.ActionSubtle.Border.Color3
	Copy.SecondaryButton.Border.Transparency = FoundationTokensDefaultScale.Color.ActionSubtle.Border.Transparency
	Copy.ShimmerPanel.Color = FoundationTokensDefaultScale.Color.Common.Shimmer.Color3
	Copy.ShimmerPanel.Transparency = FoundationTokensDefaultScale.Color.Common.Shimmer.Transparency
	Copy.AlertWindow.Background.Color = FoundationTokensDefaultScale.Color.Surface.Surface_300.Color3
	Copy.AlertWindow.Title.Color = FoundationTokensDefaultScale.Color.Content.Emphasis.Color3
	Copy.AlertWindow.Message.Color = FoundationTokensDefaultScale.Color.Content.Default.Color3
	Copy.AlertWindow.Divider.Color = FoundationTokensDefaultScale.Color.Stroke.Default.Color3
	Copy.GameDetails.GameInfoList.Cells.Background.Color = FoundationTokensDefaultScale.Color.State.Press.Color3
	Copy.GameDetails.GameInfoList.Cells.Background.Transparency.Pressed = FoundationTokensDefaultScale.Color.State.Press.Transparency
	Copy.GameMediaAccordion.Item.BackgroundColor = FoundationTokensDefaultScale.Color.Surface.Surface_300.Color3
	Copy.GameMediaAccordion.Item.BackgroundTransparency = 0.5
	Copy.GameMediaAccordion.FakeItem.Loading.Color = FoundationTokensDefaultScale.Color.Surface.Surface_300.Color3
	Copy.GameMediaAccordion.FakeItem.Loading.BaseTransparency = 0.5
	Copy.GameMediaAccordion.FakeItem.Loaded.Color = FoundationTokensDefaultScale.Color.OverMedia.OverMedia_200.Color3
	Copy.GameMediaAccordion.FakeItem.Loaded.BaseTransparency = FoundationTokensDefaultScale.Color.OverMedia.OverMedia_200.Transparency
	Copy.GameMediaAccordion.VideoIconColor = FoundationTokensDefaultScale.Color.Content.Emphasis.Color3
	
	return Copy
end

function ThemeProvider.init(p1, p2)
	-- upvalues: GetThemeModuleForStringModule (copy), Tokens (copy), v9 (copy)
	local ThemeName = p2.themeName
	p1.state = {
		theme = v9(GetThemeModuleForStringModule(ThemeName), (Tokens.getFoundationTokensDefaultScale(ThemeName)))
	}
end

function ThemeProvider.didMount(p1)
	-- upvalues: AppStorageService (copy), LocalStorageKey (copy), GetThemeModuleForStringModule (copy), Tokens (copy), v9 (copy)
	p1.connection = AppStorageService.ItemWasSet:Connect(function(AuthenticatedTheme, Value)
		-- upvalues: LocalStorageKey (upval), GetThemeModuleForStringModule (upval), Tokens (upval), v9 (upval), p1 (copy)
		if AuthenticatedTheme == LocalStorageKey.AuthenticatedTheme then
			p1:setState({
				theme = v9(GetThemeModuleForStringModule(Value), (Tokens.getFoundationTokensDefaultScale(Value)))
			})
		end
	end)
end

function ThemeProvider.willUnmount(p1)
	if p1.connection then
		p1.connection:Disconnect()
	end
end

function ThemeProvider.render(p1)
	-- upvalues: RoactModule (copy), ThemeContextDEPRECATEDModule (copy)
	return RoactModule.createElement(ThemeContextDEPRECATEDModule.Provider, { value = p1.state.theme }, p1.props[RoactModule.Children])
end

return ThemeProvider