local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local AppPageModule = require(Modules.LuaApp.AppPage)
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local FFlagDebugShowSiteMessageBannerModule = require(Modules.LuaApp.Flags.FFlagDebugShowSiteMessageBanner)
local FFlagShowDOTADogfoodSiteMessageModule = require(Modules.LuaApp.Flags.FFlagShowDOTADogfoodSiteMessage)
local SiteMessageBanner = RoactModule.PureComponent:extend("SiteMessageBanner")

function SiteMessageBanner.init(p1)
	-- upvalues: AppPageModule (copy)
	local Flag = true
	
	function p1.navigate()
		-- upvalues: p1 (copy), Flag (ref), AppPageModule (upval)
		if p1.props.messageLink and Flag then
			Flag = false
			p1.props.linking:isURLRegistered(p1.props.messageLink):andThen(function(Result)
				-- upvalues: p1 (upval), AppPageModule (upval), Flag (upval)
				if Result then
					p1.props.linking:detectURL(p1.props.messageLink)
				else
					p1.props.navigateDown({
						name = AppPageModule.GenericWebPage,
						detail = p1.props.messageLink,
						extraProps = { title = p1.props.messageText }
					})
				end
				Flag = true
			end)
		end
	end
end

function SiteMessageBanner.render(p1)
	-- upvalues: RoactModule (copy), FFlagShowDOTADogfoodSiteMessageModule (copy), FFlagDebugShowSiteMessageBannerModule (copy)
	local MessageText = p1.props.messageText
	local Size = p1.props.Size
	local Position = p1.props.Position
	local Prop = p1.props[RoactModule.Change.AbsoluteSize]
	
	if FFlagShowDOTADogfoodSiteMessageModule then
		MessageText = "Happy Dogfooding!"
	end
	if FFlagDebugShowSiteMessageBannerModule and not MessageText then
		MessageText = "Testing the SiteMessageBanner"
	end
	local DesignTokens = p1.props.designTokens
	local CornerRadius = DesignTokens.cornerRadius
	local StrokeColor = DesignTokens.strokeColor
	local TextColorColor3 = DesignTokens.textColor.Color3
	local Transparency = DesignTokens.textColor.Transparency
	local TypographyFont = DesignTokens.typography.Font
	local FontSize = DesignTokens.typography.FontSize
	local VerticalPadding = DesignTokens.verticalPadding
	local HorizontalPadding = DesignTokens.horizontalPadding
	
	return RoactModule.createElement("TextButton", {
		Position = Position,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = if MessageText then Enum.AutomaticSize.Y else nil,
		AutoButtonColor = DesignTokens.autoButtonColor,
		BackgroundColor3 = DesignTokens.backgroundColor.Color3,
		BackgroundTransparency = DesignTokens.backgroundColor.Transparency,
		SelectionImageObject = p1.props.selectionCursor,
		BorderSizePixel = 0,
		Text = "",
		[RoactModule.Change.AbsoluteSize] = Prop,
		[RoactModule.Event.Activated] = p1.navigate
	}, {
		Padding = MessageText and RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, HorizontalPadding),
			PaddingRight = UDim.new(0, HorizontalPadding),
			PaddingTop = UDim.new(0, VerticalPadding),
			PaddingBottom = UDim.new(0, VerticalPadding)
		}),
		MessageTextLabel = MessageText and RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextWrapped = true,
			Size = Size,
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = TypographyFont,
			TextSize = FontSize,
			TextColor3 = TextColorColor3,
			TextTransparency = Transparency,
			Text = MessageText,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextXAlignment = Enum.TextXAlignment.Center
		}),
		UIStroke = if StrokeColor then RoactModule.createElement("UIStroke", {
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = StrokeColor.Color3,
			Transparency = StrokeColor.Transparency
		}) else nil,
		UICorner = if CornerRadius then RoactModule.createElement("UICorner", { CornerRadius = CornerRadius }) else nil
	})
end

local v1 = RoactServices.connect({ linking = AppLinking })((RoactRoduxModule.connect(function(p1, _)
	return {
		messageText = p1.SiteMessage.Text,
		messageLink = p1.SiteMessage.Link
	}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownModule(p1))
			end
		end
	}
end)(SiteMessageBanner)))

return function(p1)
	-- upvalues: UseSelectionCursorFunction (copy), CursorKind (copy), UseDesignTokensFunction (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		designTokens = UseDesignTokensFunction().LuaApps.Banner.siteMessageBanner,
		selectionCursor = UseSelectionCursorFunction(CursorKind.RoundedRect)
	}))
end