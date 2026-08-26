local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local appFonts = require(parent.Style).AppFonts
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local roactServices = require(parent.RoactServices).RoactServices
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local UIBloxModule = require(parent.UIBlox)
local withLocalization = require(parent.Localization).withLocalization
local formFactor = require(parent.FormFactor).Enums.FormFactor
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local searchBarModule = require(authCommon.Components.SearchBar)
local windowedListFrameModule = require(authCommon.Components.WindowedListFrame)
local colors = require(parent.Style).Colors
local otterModule = require(parent.Otter)
local listSearchWidget = roactModule.PureComponent:extend("ListSearchWidget")
local flint = colors.Flint
local obsidian = colors.Obsidian
local white = colors.White

function listSearchWidget.init(p1)
	-- upvalues: roactModule (ref), imageSetLabel (ref), getImageData (ref), flint (ref), imageSetButton (ref)
	p1.state = {
		fullLoad = false,
		visible = false,
		filteredList = p1.props.List
	}
	p1.visibility = 0
	p1.visibilityTarget = 0
	p1.baseFrameRef = roactModule.createRef()
	
	function p0.getWidgetPosition()
		-- upvalues: p1 (ref)
		return UDim2.new(0.5, 0, 2 - p1.visibility, 10)
	end
	
	function p0.searchTextChanged(p2)
		-- upvalues: p1 (ref)
		local lowerText = string.lower(p2.Text)
		
		if lowerText == "" then
			if p1.state.filteredList == p1.props.List then
				return
			else
				p1:setState({ filteredList = p1.props.List })
				
				return
			end
		else
			local t = {}
			
			for i, v in ipairs(p1.props.List) do
				if string.find(string.lower(v.localizedName), lowerText, 1, true) then
					table.insert(t, v)
				end
			end
			p1:setState({ filteredList = t })
		end
	end
	
	function p0.renderWidgetBackground(p3)
		-- upvalues: roactModule (copy), imageSetLabel (copy), getImageData (copy), flint (copy), p1 (ref), imageSetButton (copy)
		local var1 = 1.4 * p3.closeButtonSize
		
		if p3.isWideScreen then
			return roactModule.createElement(imageSetLabel, {
				Size = UDim2.new(1, 0, 1, -var1 + 10),
				Position = p3.Position,
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundTransparency = 1,
				Image = getImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
				ImageColor3 = flint,
				BorderSizePixel = 0,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9),
				Visible = p3.Visible,
				[roactModule.Ref] = p1.baseFrameRef
			}, {
				CloseButton = roactModule.createElement(imageSetButton, {
					Size = UDim2.new(0, p3.closeButtonSize, 0, p3.closeButtonSize),
					AnchorPoint = Vector2.new(0, 1),
					Image = getImageData("LuaApp/icons/GameDetails/navigation/close") or "LuaApp/icons/GameDetails/navigation/close",
					BackgroundTransparency = 1,
					[roactModule.Event.Activated] = p3.CloseCallback
				}),
				UISizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(600, 1e999) }),
				ContentWrapper = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -80, 1, -50),
					Position = UDim2.new(0, 40, 0, 40)
				}, p3.contents)
			})
		end
		local var2 = p3.closeButtonSize + 20
		
		return roactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 10),
			Position = p3.Position,
			AnchorPoint = Vector2.new(0.5, 1),
			BackgroundColor3 = flint,
			Visible = p3.Visible,
			[roactModule.Ref] = p1.baseFrameRef
		}, {
			UIPadding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 40),
				PaddingLeft = UDim.new(0, 20),
				PaddingRight = UDim.new(0, 20),
				PaddingBottom = UDim.new(0, 10)
			}),
			CloseButton = roactModule.createElement(imageSetButton, {
				Size = UDim2.new(0, p3.closeButtonSize, 0, p3.closeButtonSize),
				Image = getImageData("LuaApp/icons/GameDetails/navigation/close") or "LuaApp/icons/GameDetails/navigation/close",
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.21, 0),
				[roactModule.Event.Activated] = p3.CloseCallback
			}),
			ContentWrapper = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -var2),
				Position = UDim2.new(0, 0, 0, var2)
			}, p3.contents)
		})
	end
end

function listSearchWidget.didMount(p2)
	-- upvalues: otterModule (ref)
	p2.motor = otterModule.createSingleMotor(p2.visibility)
	p2.motor:onStep(function(p3)
		-- upvalues: p2 (ref)
		p2.visibility = p3
		
		if p2.baseFrameRef.current then
			p2.baseFrameRef.current.Position = p2.getWidgetPosition()
			p2.baseFrameRef.current.Parent.BackgroundTransparency = 1 - 0.5 * p2.visibility
		end
		if p3 == 0 and p2.state.visible then
			p2:setState({ visible = false })
			
			return
		elseif p3 == 1 and not p2.state.fullLoad then
			p2:setState({ fullLoad = true })
		end
	end)
end

function listSearchWidget.willUnmount(p2)
	if p2.motor then
		p2.motor:destroy()
	end
end

listSearchWidget.defaultProps = { SearchPlaceholder = "Feature.Chat.Label.SearchWord" }

function listSearchWidget.render(p2)
	-- upvalues: formFactor (ref), withLocalization (ref), roactModule (ref), appFonts (ref), white (ref), searchBarModule (ref), obsidian (ref), flint (ref), windowedListFrameModule (ref)
	local var1 = p2.props.formFactor == formFactor.WIDE
	local var2 = 27
	local var3 = 14
	local var4 = 24
	local var5 = 24
	local var6 = var3 + 36
	
	if var1 then
		var2 = 48
		var3 = 18
		var4 = 30
		var5 = 24
		var6 = var3 + 48
	end
	local var7 = var3 * 2.4
	local var8 = var7 + 40 + var5
	local var9 = p2.props.VisibilityTarget == 1
	
	return withLocalization({
		heading = p2.props.Heading,
		search = p2.props.SearchPlaceholder
	})(function(p3)
		-- upvalues: var9 (ref), roactModule (copy), p2 (ref), var1 (ref), var2 (write), var5 (write), appFonts (copy), white (copy), searchBarModule (copy), var7 (ref), obsidian (copy), flint (copy), var4 (write), var3 (write), windowedListFrameModule (copy), var8 (ref), var6 (write)
		return roactModule.createElement(if var9 then "TextButton" else "Frame", {
			BorderSizePixel = 0,
			AutoButtonColor = if var9 then false else nil,
			Text = if var9 then "" else nil,
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1 - 0.5 * p2.visibility,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			roactModule.createElement(p2.renderWidgetBackground, {
				isWideScreen = var1,
				closeButtonSize = var2,
				Position = p2.getWidgetPosition(),
				CloseCallback = p2.props.CloseCallback,
				Visible = p2.state.visible,
				contents = {
					Heading = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = p3.heading,
						Size = UDim2.new(1, 0, 0, var5),
						TextSize = var5,
						Font = appFonts.default:getBold(),
						TextColor3 = white,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					SearchBar = roactModule.createElement(searchBarModule, {
						Text = "",
						Size = UDim2.new(1, 0, 0, var7),
						Position = UDim2.new(0, 0, 0, var5 + 20),
						ImageColor3 = obsidian,
						PlaceholderText = p3.search,
						PlaceholderColor3 = flint,
						IconSize = var4,
						TextSize = var3,
						TextColor3 = white,
						TextChanged = p2.searchTextChanged
					}),
					ListFrame = roactModule.createElement(windowedListFrameModule, {
						List = p2.state.filteredList,
						ScrollingFrameOffset = var8,
						TextSize = var3,
						ButtonSizeY = var6,
						ListButton = p2.props.ListButton,
						ListButtonProps = {
							TextSize = var3,
							SelectionCallback = p2.props.SelectionCallback
						}
					})
				}
			})
		})
	end)
end

function listSearchWidget.didUpdate(p2, p3)
	-- upvalues: otterModule (ref)
	if p2.visibilityTarget ~= p2.props.VisibilityTarget and p2.motor then
		p2.visibilityTarget = p2.props.VisibilityTarget
		p2.motor:setGoal(otterModule.spring(p2.visibilityTarget), { frequency = 3 })
		
		if p2.visibilityTarget > 0 and not p2.state.visible then
			p2:setState({ visible = true })
		end
	end
	if p3.List ~= p2.props.List or p2.props.VisibilityTarget == 1 and p3.VisibilityTarget ~= 1 then
		p2:setState({ filteredList = p2.props.List })
	end
end

return roactServices.connect({ networking = roactNetworking })(roactRoduxModule.connect(function(p2, _)
	return { formFactor = p2.FormFactor }
end)(listSearchWidget))