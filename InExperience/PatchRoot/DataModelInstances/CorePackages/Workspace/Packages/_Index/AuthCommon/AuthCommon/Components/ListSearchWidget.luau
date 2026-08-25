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

function listSearchWidget.init(p0)
	-- upvalues: roactModule (ref), imageSetLabel (ref), getImageData (ref), flint (ref), imageSetButton (ref)
	p0.state = {
		fullLoad = false,
		visible = false,
		filteredList = p0.props.List
	}
	p0.visibility = 0
	p0.visibilityTarget = 0
	p0.baseFrameRef = roactModule.createRef()
	
	function p0.getWidgetPosition()
		-- upvalues: p0 (ref)
		return UDim2.new(0.5, 0, 2 - p0.visibility, 10)
	end
	
	function p0.searchTextChanged(p1)
		-- upvalues: p0 (ref)
		local lowerText = string.lower(p1.Text)
		
		if lowerText == "" then
			if p0.state.filteredList == p0.props.List then
				return
			else
				p0:setState({ filteredList = p0.props.List })
				
				return
			end
		else
			local t = {}
			
			for i, v in ipairs(p0.props.List) do
				if string.find(string.lower(v.localizedName), lowerText, 1, true) then
					table.insert(t, v)
				end
			end
			p0:setState({ filteredList = t })
		end
	end
	
	function p0.renderWidgetBackground(p2)
		-- upvalues: roactModule (copy), imageSetLabel (copy), getImageData (copy), flint (copy), p0 (ref), imageSetButton (copy)
		local var10 = 1.4 * p2.closeButtonSize
		
		if p2.isWideScreen then
			return roactModule.createElement(imageSetLabel, {
				Size = UDim2.new(1, 0, 1, -var10 + 10),
				Position = p2.Position,
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundTransparency = 1,
				Image = getImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
				ImageColor3 = flint,
				BorderSizePixel = 0,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9),
				Visible = p2.Visible,
				[roactModule.Ref] = p0.baseFrameRef
			}, {
				CloseButton = roactModule.createElement(imageSetButton, {
					Size = UDim2.new(0, p2.closeButtonSize, 0, p2.closeButtonSize),
					AnchorPoint = Vector2.new(0, 1),
					Image = getImageData("LuaApp/icons/GameDetails/navigation/close") or "LuaApp/icons/GameDetails/navigation/close",
					BackgroundTransparency = 1,
					[roactModule.Event.Activated] = p2.CloseCallback
				}),
				UISizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(600, 1e999) }),
				ContentWrapper = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -80, 1, -50),
					Position = UDim2.new(0, 40, 0, 40)
				}, p2.contents)
			})
		end
		local var11 = p2.closeButtonSize + 20
		
		return roactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 10),
			Position = p2.Position,
			AnchorPoint = Vector2.new(0.5, 1),
			BackgroundColor3 = flint,
			Visible = p2.Visible,
			[roactModule.Ref] = p0.baseFrameRef
		}, {
			UIPadding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 40),
				PaddingLeft = UDim.new(0, 20),
				PaddingRight = UDim.new(0, 20),
				PaddingBottom = UDim.new(0, 10)
			}),
			CloseButton = roactModule.createElement(imageSetButton, {
				Size = UDim2.new(0, p2.closeButtonSize, 0, p2.closeButtonSize),
				Image = getImageData("LuaApp/icons/GameDetails/navigation/close") or "LuaApp/icons/GameDetails/navigation/close",
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.21, 0),
				[roactModule.Event.Activated] = p2.CloseCallback
			}),
			ContentWrapper = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -var11),
				Position = UDim2.new(0, 0, 0, var11)
			}, p2.contents)
		})
	end
end

function listSearchWidget.didMount(p3)
	-- upvalues: otterModule (ref)
	p3.motor = otterModule.createSingleMotor(p3.visibility)
	p3.motor:onStep(function(p4)
		-- upvalues: p3 (ref)
		p3.visibility = p4
		
		if p3.baseFrameRef.current then
			p3.baseFrameRef.current.Position = p3.getWidgetPosition()
			p3.baseFrameRef.current.Parent.BackgroundTransparency = 1 - 0.5 * p3.visibility
		end
		if p4 == 0 and p3.state.visible then
			p3:setState({ visible = false })
			
			return
		elseif p4 == 1 and not p3.state.fullLoad then
			p3:setState({ fullLoad = true })
		end
	end)
end

function listSearchWidget.willUnmount(p5)
	if p5.motor then
		p5.motor:destroy()
	end
end

listSearchWidget.defaultProps = { SearchPlaceholder = "Feature.Chat.Label.SearchWord" }

function listSearchWidget.render(p6)
	-- upvalues: formFactor (ref), withLocalization (ref), roactModule (ref), appFonts (ref), white (ref), searchBarModule (ref), obsidian (ref), flint (ref), windowedListFrameModule (ref)
	local var12 = p6.props.formFactor == formFactor.WIDE
	local var13 = 27
	local var14 = 14
	local var15 = 24
	local var16 = 24
	local var17 = var14 + 36
	
	if var12 then
		var13 = 48
		var14 = 18
		var15 = 30
		var16 = 24
		var17 = var14 + 48
	end
	local var18 = var14 * 2.4
	local var19 = var18 + 40 + var16
	local var20 = p6.props.VisibilityTarget == 1
	
	return withLocalization({
		heading = p6.props.Heading,
		search = p6.props.SearchPlaceholder
	})(function(p7)
		-- upvalues: var20 (ref), roactModule (copy), p6 (ref), var12 (ref), var13 (write), var16 (write), appFonts (copy), white (copy), searchBarModule (copy), var18 (ref), obsidian (copy), flint (copy), var15 (write), var14 (write), windowedListFrameModule (copy), var19 (ref), var17 (write)
		return roactModule.createElement(if var20 then "TextButton" else "Frame", {
			BorderSizePixel = 0,
			AutoButtonColor = if var20 then false else nil,
			Text = if var20 then "" else nil,
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1 - 0.5 * p6.visibility,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			roactModule.createElement(p6.renderWidgetBackground, {
				isWideScreen = var12,
				closeButtonSize = var13,
				Position = p6.getWidgetPosition(),
				CloseCallback = p6.props.CloseCallback,
				Visible = p6.state.visible,
				contents = {
					Heading = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = p7.heading,
						Size = UDim2.new(1, 0, 0, var16),
						TextSize = var16,
						Font = appFonts.default:getBold(),
						TextColor3 = white,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					SearchBar = roactModule.createElement(searchBarModule, {
						Text = "",
						Size = UDim2.new(1, 0, 0, var18),
						Position = UDim2.new(0, 0, 0, var16 + 20),
						ImageColor3 = obsidian,
						PlaceholderText = p7.search,
						PlaceholderColor3 = flint,
						IconSize = var15,
						TextSize = var14,
						TextColor3 = white,
						TextChanged = p6.searchTextChanged
					}),
					ListFrame = roactModule.createElement(windowedListFrameModule, {
						List = p6.state.filteredList,
						ScrollingFrameOffset = var19,
						TextSize = var14,
						ButtonSizeY = var17,
						ListButton = p6.props.ListButton,
						ListButtonProps = {
							TextSize = var14,
							SelectionCallback = p6.props.SelectionCallback
						}
					})
				}
			})
		})
	end)
end

function listSearchWidget.didUpdate(p8, p9)
	-- upvalues: otterModule (ref)
	if p8.visibilityTarget ~= p8.props.VisibilityTarget and p8.motor then
		p8.visibilityTarget = p8.props.VisibilityTarget
		p8.motor:setGoal(otterModule.spring(p8.visibilityTarget), { frequency = 3 })
		
		if p8.visibilityTarget > 0 and not p8.state.visible then
			p8:setState({ visible = true })
		end
	end
	if p9.List ~= p8.props.List or p8.props.VisibilityTarget == 1 and p9.VisibilityTarget ~= 1 then
		p8:setState({ filteredList = p8.props.List })
	end
end

return roactServices.connect({ networking = roactNetworking })(roactRoduxModule.connect(function(p10, _)
	return { formFactor = p10.FormFactor }
end)(listSearchWidget))