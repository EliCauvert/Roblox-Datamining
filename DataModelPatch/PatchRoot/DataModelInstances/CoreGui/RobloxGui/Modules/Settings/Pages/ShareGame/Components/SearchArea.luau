local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ShareGame = RobloxGui.Modules.Settings.Pages.ShareGame
local GetFFlagShareGameSearchBoxFocusAnalyticsModule = require(RobloxGui.Modules.Settings.Flags.GetFFlagShareGameSearchBoxFocusAnalytics)
local SearchBoxModule = require(ShareGame.Components.SearchBox)
local IconButtonModule = require(ShareGame.Components.IconButton)
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local SetSearchAreaActiveModule = require(ShareGame.Actions.SetSearchAreaActive)
local SetSearchTextModule = require(ShareGame.Actions.SetSearchText)
local ShareGameIconsModule = require(RobloxGui.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons)
local Translator = require(ShareGame.getTranslator)()
local ImagePath = ShareGameIconsModule:GetImagePath()
local SearchLargeFrame = ShareGameIconsModule:GetFrame("search_large")
local FontResult = ThemeModule.font(Enum.Font.SourceSans)
local GRAY3 = require(ShareGame.Constants).Color.GRAY3
local TextSizeResult = ThemeModule.textSize(20)
local SearchArea = RoactModule.PureComponent:extend("SearchArea")

function SearchArea.init(p1)
	-- upvalues: Translator (copy)
	p1.state = {
		cancelText = Translator:FormatByKey("Feature.SettingsHub.Action.CancelSearch")
	}
	p1.searchField = nil
end

function SearchArea.render(p1)
	-- upvalues: Text (copy), FontResult (copy), TextSizeResult (copy), RoactModule (copy), IconButtonModule (copy), ImagePath (copy), SearchLargeFrame (copy), SearchBoxModule (copy), GetFFlagShareGameSearchBoxFocusAnalyticsModule (copy), GRAY3 (copy)
	local AnchorPoint = p1.props.anchorPoint
	local Position = p1.props.position
	local ZIndex = p1.props.zIndex
	local SearchAreaActive = p1.props.searchAreaActive
	local Size = p1.props.size
	local CancelText = p1.state.cancelText
	local TextWidth = Text.GetTextWidth(CancelText, FontResult, TextSizeResult)
	local NewSearchBoxMargin = p1.props.searchBoxMargin + TextWidth
	local SetSearchText = p1.props.setSearchText
	
	return if p1.props.fullWidthSearchBar then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = AnchorPoint,
		Position = Position,
		Size = Size,
		ZIndex = ZIndex
	}, {
		SearchButton = RoactModule.createElement(IconButtonModule, {
			visible = not SearchAreaActive,
			anchorPoint = AnchorPoint,
			position = Position,
			size = UDim2.new(0, 44, 0, 44),
			zIndex = ZIndex,
			iconHorizontalAlignment = Enum.HorizontalAlignment.Right,
			iconSpritePath = ImagePath,
			iconSpriteFrame = SearchLargeFrame,
			onClick = function(_)
				-- upvalues: p1 (copy)
				p1.props.setSearchAreaActive(true)
			end
		}),
		SearchBox = RoactModule.createElement(SearchBoxModule, {
			anchorPoint = Vector2.new(0, 0.5),
			position = UDim2.new(0, 0, 0.5, 0),
			size = UDim2.new(1, -NewSearchBoxMargin, 0, 28),
			zIndex = ZIndex,
			visible = SearchAreaActive,
			modalFocused = SearchAreaActive,
			onTextChanged = SetSearchText,
			onTextBoxFocused = function()
				-- upvalues: GetFFlagShareGameSearchBoxFocusAnalyticsModule (upval), p1 (copy)
				if GetFFlagShareGameSearchBoxFocusAnalyticsModule() and p1.props.analytics then
					p1.props.analytics:onSearchFocused()
				end
			end,
			onTextBoxFocusLost = function(p2)
				-- upvalues: p1 (copy)
				if p2 == "" then
					p1.props.setSearchAreaActive(false)
				end
			end,
			searchFieldRef = function(SearchField)
				-- upvalues: p1 (copy)
				p1.searchField = SearchField
			end
		}),
		Cancel = RoactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.new(0, TextWidth, 1, 0),
			TextSize = TextSizeResult,
			TextColor3 = GRAY3,
			Font = FontResult,
			ZIndex = ZIndex,
			Visible = SearchAreaActive,
			[RoactModule.Ref] = function(Object)
				-- upvalues: CancelText (copy), p1 (copy)
				if Object then
					Object.Text = CancelText
					
					if not p1.textConnection then
						p1.textConnection = Object:GetPropertyChangedSignal("Text"):connect(function()
							-- upvalues: p1 (upval), Object (copy)
							p1:setState({ cancelText = Object.Text })
						end)
					end
				end
			end,
			[RoactModule.Event.Activated] = function(_)
				-- upvalues: p1 (copy)
				p1.props.setSearchAreaActive(false)
			end
		})
	}) else RoactModule.createElement(SearchBoxModule, {
		anchorPoint = Vector2.new(1, 0.5),
		position = UDim2.new(1, 0, 0.5, 0),
		size = UDim2.new(0, 177, 0, 28),
		zIndex = ZIndex,
		onTextChanged = SetSearchText,
		searchFieldRef = function(SearchField)
			-- upvalues: p1 (copy)
			p1.searchField = SearchField
		end
	})
end

function SearchArea.didUpdate(p1, p2)
	local FullWidthSearchBar = p1.props.fullWidthSearchBar
	
	if p1.searchField then
		if not p1.props.isPageOpen and p2.isPageOpen then
			spawn(function()
				-- upvalues: FullWidthSearchBar (copy), p1 (copy)
				if FullWidthSearchBar then
					p1.props.setSearchAreaActive(false)
					
					return
				else
					p1.searchField.Text = ""
				end
			end)
		end
		if FullWidthSearchBar then
			local SearchAreaActive = p1.props.searchAreaActive
			local SearchAreaActive1 = p2.searchAreaActive
			
			if SearchAreaActive and not SearchAreaActive1 then
				p1.searchField:CaptureFocus()
				
				return
			end
			if not SearchAreaActive and SearchAreaActive1 then
				p1.searchField.Text = ""
			end
		end
	end
end

return (RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		isPageOpen = p1.Page.IsOpen,
		searchAreaActive = p1.ConversationsSearch.SearchAreaActive
	}
end, function(Callback)
	-- upvalues: SetSearchAreaActiveModule (copy), SetSearchTextModule (copy)
	return {
		setSearchAreaActive = function(p1)
			-- upvalues: Callback (copy), SetSearchAreaActiveModule (upval)
			Callback(SetSearchAreaActiveModule(p1))
		end,
		setSearchText = function(p1)
			-- upvalues: Callback (copy), SetSearchTextModule (upval)
			Callback(SetSearchTextModule(p1))
		end
	}
end)(SearchArea))