local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local getFFlagShareGameSearchBoxFocusAnalyticsModule = require(robloxGui.Modules.Settings.Flags.GetFFlagShareGameSearchBoxFocusAnalytics)
local searchBoxModule = require(shareGame.Components.SearchBox)
local iconButtonModule = require(shareGame.Components.IconButton)
local constantsModule = require(shareGame.Constants)
local text = require(corePackagesService.Workspace.Packages.AppCommonLib).Text
local themeModule = require(robloxGui.Modules.Settings.Theme)
local setSearchAreaActiveModule = require(shareGame.Actions.SetSearchAreaActive)
local setSearchTextModule = require(shareGame.Actions.SetSearchText)
local shareGameIconsModule = require(robloxGui.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons)
local var1 = require(shareGame.getTranslator)()
local imagePath = shareGameIconsModule:GetImagePath()
local searchLargeFrame = shareGameIconsModule:GetFrame("search_large")
local var2 = themeModule.font(Enum.Font.SourceSans)
local GRAY3 = constantsModule.Color.GRAY3
local var3 = themeModule.textSize(20)
local searchArea = roactModule.PureComponent:extend("SearchArea")

function searchArea.init(p1)
	-- upvalues: var1 (ref)
	p1.state = {
		cancelText = var1:FormatByKey("Feature.SettingsHub.Action.CancelSearch")
	}
	p1.searchField = nil
end

function searchArea.render(p1)
	-- upvalues: text (ref), var2 (ref), var3 (ref), roactModule (ref), iconButtonModule (ref), imagePath (ref), searchLargeFrame (ref), searchBoxModule (ref), getFFlagShareGameSearchBoxFocusAnalyticsModule (ref), GRAY3 (ref)
	local fullWidthSearchBar = p1.props.fullWidthSearchBar
	local searchBoxMargin = p1.props.searchBoxMargin
	local anchorPoint = p1.props.anchorPoint
	local position = p1.props.position
	local zIndex = p1.props.zIndex
	local searchAreaActive = p1.props.searchAreaActive
	local size = p1.props.size
	local cancelText = p1.state.cancelText
	local textWidth = text.GetTextWidth(cancelText, var2, var3)
	local setSearchText = p1.props.setSearchText
	
	return if fullWidthSearchBar then roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = anchorPoint,
		Position = position,
		Size = size,
		ZIndex = zIndex
	}, {
		SearchButton = roactModule.createElement(iconButtonModule, {
			visible = not searchAreaActive,
			anchorPoint = anchorPoint,
			position = position,
			size = UDim2.new(0, 44, 0, 44),
			zIndex = zIndex,
			iconHorizontalAlignment = Enum.HorizontalAlignment.Right,
			iconSpritePath = imagePath,
			iconSpriteFrame = searchLargeFrame,
			onClick = function(_)
				-- upvalues: p1 (ref)
				p1.props.setSearchAreaActive(true)
			end
		}),
		SearchBox = roactModule.createElement(searchBoxModule, {
			anchorPoint = Vector2.new(0, 0.5),
			position = UDim2.new(0, 0, 0.5, 0),
			size = UDim2.new(1, -(searchBoxMargin + textWidth), 0, 28),
			zIndex = zIndex,
			visible = searchAreaActive,
			modalFocused = searchAreaActive,
			onTextChanged = setSearchText,
			onTextBoxFocused = function()
				-- upvalues: getFFlagShareGameSearchBoxFocusAnalyticsModule (copy), p1 (ref)
				if getFFlagShareGameSearchBoxFocusAnalyticsModule() and p1.props.analytics then
					p1.props.analytics:onSearchFocused()
				end
			end,
			onTextBoxFocusLost = function(p2)
				-- upvalues: p1 (ref)
				if p2 == "" then
					p1.props.setSearchAreaActive(false)
				end
			end,
			searchFieldRef = function(p2)
				-- upvalues: p1 (ref)
				p1.searchField = p2
			end
		}),
		Cancel = roactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.new(0, textWidth, 1, 0),
			TextSize = var3,
			TextColor3 = GRAY3,
			Font = var2,
			ZIndex = zIndex,
			Visible = searchAreaActive,
			[roactModule.Ref] = function(p2)
				-- upvalues: cancelText (ref), p1 (ref)
				if p2 then
					p2.Text = cancelText
					
					if not p1.textConnection then
						p1.textConnection = p2:GetPropertyChangedSignal("Text"):connect(function()
							-- upvalues: p1 (copy), p2 (ref)
							p1:setState({ cancelText = p2.Text })
						end)
					end
				end
			end,
			[roactModule.Event.Activated] = function(_)
				-- upvalues: p1 (ref)
				p1.props.setSearchAreaActive(false)
			end
		})
	}) else roactModule.createElement(searchBoxModule, {
		anchorPoint = Vector2.new(1, 0.5),
		position = UDim2.new(1, 0, 0.5, 0),
		size = UDim2.new(0, 177, 0, 28),
		zIndex = zIndex,
		onTextChanged = setSearchText,
		searchFieldRef = function(p2)
			-- upvalues: p1 (ref)
			p1.searchField = p2
		end
	})
end

function searchArea.didUpdate(p1, p2)
	local fullWidthSearchBar = p1.props.fullWidthSearchBar
	
	if p1.searchField then
		if not p1.props.isPageOpen and p2.isPageOpen then
			spawn(function()
				-- upvalues: fullWidthSearchBar (ref), p1 (ref)
				if fullWidthSearchBar then
					p1.props.setSearchAreaActive(false)
					
					return
				end
				p1.searchField.Text = ""
			end)
		end
		if fullWidthSearchBar then
			local searchAreaActive = p1.props.searchAreaActive
			local searchAreaActive_1 = p2.searchAreaActive
			
			if searchAreaActive and not searchAreaActive_1 then
				p1.searchField:CaptureFocus()
				
				return
			elseif not searchAreaActive and searchAreaActive_1 then
				p1.searchField.Text = ""
			end
		end
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		isPageOpen = p1.Page.IsOpen,
		searchAreaActive = p1.ConversationsSearch.SearchAreaActive
	}
end, function(p1)
	-- upvalues: setSearchAreaActiveModule (ref), setSearchTextModule (ref)
	return {
		setSearchAreaActive = function(value)
			-- upvalues: p1 (ref), setSearchAreaActiveModule (copy)
			p1(setSearchAreaActiveModule(value))
		end,
		setSearchText = function(value)
			-- upvalues: p1 (ref), setSearchTextModule (copy)
			p1(setSearchTextModule(value))
		end
	}
end)(searchArea)