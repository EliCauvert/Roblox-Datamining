local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local TopBarModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.TopBar.TopBar)
local IsRunningInStudioFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isRunningInStudio
local WebViewRedesignEnabledEngineFeature = game:GetEngineFeature("WebViewRedesignEnabled")

local function renderPage(p1, p2)
	-- upvalues: IsRunningInStudioFunction (copy), RoactModule (copy), TopBarModule (copy), WebViewRedesignEnabledEngineFeature (copy)
	local IsVisible = p1.isVisible or false
	
	if IsRunningInStudioFunction() then
		local BackgroundDefault = p2.Theme.BackgroundDefault
		
		return RoactModule.createElement("Frame", {
			Visible = IsVisible,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = BackgroundDefault.Color,
			BackgroundTransparency = BackgroundDefault.Transparency
		}, {
			TopBar = RoactModule.createElement(TopBarModule.Container, {
				titleText = "WebViewStub",
				leftItem = TopBarModule.BackButton
			})
		})
	else
		local Overlay = p2.Theme.Overlay
		
		return RoactModule.createElement("TextButton", {
			Text = "",
			Active = false,
			AutoButtonColor = false,
			Selectable = false,
			Visible = IsVisible,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = if WebViewRedesignEnabledEngineFeature then p2.Theme.BackgroundDefault.Color else Overlay.Color,
			BackgroundTransparency = if WebViewRedesignEnabledEngineFeature then 0 else Overlay.Transparency
		})
	end
end

return function(p1)
	-- upvalues: WithStyleFunction (copy), renderPage (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: renderPage (upval), p1 (copy)
		return renderPage(p1, p2)
	end)
end