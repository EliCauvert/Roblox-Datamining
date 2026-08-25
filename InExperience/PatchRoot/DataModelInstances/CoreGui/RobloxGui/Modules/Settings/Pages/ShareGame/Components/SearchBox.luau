local corePackagesService = game:GetService("CorePackages")
local fFlagConnectionsToFriendsRename = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local constantsModule = require(robloxGui.Modules.Settings.Pages.ShareGame.Constants)
local searchBox = roactModule.Component:extend("SearchBox")
local shareGameIconsModule = require(robloxGui.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons)
local imagePath = shareGameIconsModule:GetImagePath()
local searchBorderFrame = shareGameIconsModule:GetFrame("search_border")
local rect = Rect.new(3, 3, 4, 4)
local searchSmallFrame = shareGameIconsModule:GetFrame("search_small")
local clearFrame = shareGameIconsModule:GetFrame("clear")
local themeModule = require(robloxGui.Modules.Settings.Theme)
local var12 = require(robloxGui.Modules.Settings.Pages.ShareGame.getTranslator)()

function searchBox.init(p0)
	p0.state = { isTextWritten = false }
	p0.searchField = nil
end

function searchBox.render(p1)
	-- upvalues: roactModule (ref), imagePath (ref), searchBorderFrame (ref), rect (ref), imagePath (ref), searchSmallFrame (ref), constantsModule (ref), fFlagConnectionsToFriendsRename (ref), var12 (ref), themeModule (ref), imagePath (ref), clearFrame (ref)
	local anchorPoint = p1.props.anchorPoint
	local onTextBoxFocusLost = p1.props.onTextBoxFocusLost
	local onTextBoxFocused = p1.props.onTextBoxFocused
	local position = p1.props.position
	local searchFieldRef = p1.props.searchFieldRef
	local zIndex = p1.props.zIndex
	
	return roactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		AnchorPoint = anchorPoint,
		Position = position,
		Size = p1.props.size,
		Visible = p1.props.visible,
		Image = imagePath,
		ImageRectOffset = searchBorderFrame.offset,
		ImageRectSize = searchBorderFrame.size,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = rect,
		ZIndex = zIndex
	}, {
		UIPadding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6)
		}),
		SearchIcon = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = imagePath,
			ImageRectOffset = searchSmallFrame.offset,
			ImageRectSize = searchSmallFrame.size,
			Size = UDim2.new(0, 16, 0, 16),
			ZIndex = zIndex
		}),
		SearchField = roactModule.createElement("TextBox", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 28, 0.5, 0),
			Size = UDim2.new(1, -56, 1, 0),
			ClearTextOnFocus = false,
			PlaceholderColor3 = constantsModule.Color.GRAY3,
			PlaceholderText = if fFlagConnectionsToFriendsRename then var12:FormatByKey("Feature.SettingsHub.Label.SearchForFriendsPlaceholder.FriendsRename") else var12:FormatByKey("Feature.SettingsHub.Label.SearchForFriendsPlaceholder"),
			Text = "",
			TextColor3 = constantsModule.Color.WHITE,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = themeModule.textSize(16),
			Font = themeModule.font(Enum.Font.SourceSans),
			ZIndex = zIndex,
			[roactModule.Ref] = function(p2)
				-- upvalues: p1 (ref), searchFieldRef (ref)
				p1.searchField = p2
				
				if searchFieldRef then
					searchFieldRef(p2)
				end
			end,
			[roactModule.Event.Focused] = function()
				-- upvalues: onTextBoxFocused (ref)
				if onTextBoxFocused then
					onTextBoxFocused()
				end
			end,
			[roactModule.Event.FocusLost] = function(p3)
				-- upvalues: onTextBoxFocusLost (ref)
				if onTextBoxFocusLost then
					onTextBoxFocusLost(p3.Text)
				end
			end
		}),
		ClearButton = roactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			Size = UDim2.new(0, 16, 0, 16),
			Image = imagePath,
			ImageRectOffset = clearFrame.offset,
			ImageRectSize = clearFrame.size,
			ZIndex = zIndex,
			Visible = p1.state.isTextWritten,
			[roactModule.Event.Activated] = function()
				-- upvalues: p1 (ref)
				if p1.searchField then
					p1.searchField.Text = ""
					p1.searchField:CaptureFocus()
				end
			end
		})
	})
end

function searchBox.didMount(p4)
	local searchField = p4.searchField
	local onTextChanged = p4.props.onTextChanged
	
	if searchField then
		p4.textBoxChangedConnection = searchField:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: searchField (ref), p4 (ref), onTextChanged (ref)
			local text = searchField.Text
			p4:setState({ isTextWritten = text:len() > 0 })
			onTextChanged(text)
		end)
	end
end

function searchBox.willUnmount(p5)
	if p5.textBoxChangedConnection then
		p5.textBoxChangedConnection:Disconnect()
	end
end

return searchBox