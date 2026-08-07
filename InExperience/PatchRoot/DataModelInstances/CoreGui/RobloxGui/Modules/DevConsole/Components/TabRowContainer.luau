local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local textService = game:GetService("TextService")
local setActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)
local tabRowButtonModule = require(script.Parent.TabRowButton)
local dropDownModule = require(script.Parent.DropDown)
local fullScreenDropDownButtonModule = require(script.Parent.FullScreenDropDownButton)
local constantsModule = require(script.Parent.Parent.Constants)
local tabDropDownWidth = constantsModule.TabRowFormatting.TabDropDownWidth
local tabOverlapThreshold = constantsModule.TabRowFormatting.TabOverlapThreshold
local tabRowContainer = roactModule.Component:extend("TabRowContainer")

local function initTabList(p0) --[[ line: 19 ]]
	-- upvalues: textService (ref), constantsModule (ref)
	local t = {}
	local var12 = 0
	local var13 = 0
	
	for i, v in pairs(p0) do
		local var14 = textService:GetTextSize(i, constantsModule.DefaultFontSize.TabBar, constantsModule.Font.TabBar, Vector2.new(0, 0))
		t[i] = var14.X
		var12 += var14.X
		var13 += 1
	end
	return t, var12, var13
end

function tabRowContainer.init(p1) --[[ line: 33 ]]
	-- upvalues: initTabList (ref)
	local var15, var16, var17 = initTabList(p1.props.tabList)
	p1.state = {
		currContainerWidth = 0,
		textWidths = var15,
		totalTextLength = var16,
		totalTabCount = var17
	}
	
	function p1.onTabButtonClicked(p2) --[[ line: 45 ]]
		-- upvalues: p1 (ref)
		for i, v in pairs(p1.props.tabList) do
			if v.layoutOrder == p2 then
				p1.props.dispatchSetActiveTab(i, v.hasClientServer)
				
				return
			end
		end
	end
end

function tabRowContainer.didUpdate(p3, p4, _) --[[ line: 55 ]]
	-- upvalues: initTabList (ref)
	if p4.tabList ~= p3.props.tabList then
		local var18, var19, var20 = initTabList(p3.props.tabList)
		p3:setState({
			textWidths = var18,
			totalTextLength = var19,
			totalTabCount = var20
		})
	end
end

function tabRowContainer.render(p5) --[[ line: 66 ]]
	-- upvalues: tabOverlapThreshold (ref), constantsModule (ref), roactModule (ref), fullScreenDropDownButtonModule (ref), tabDropDownWidth (ref), dropDownModule (ref), tabRowButtonModule (ref)
	local tabList = p5.props.tabList
	local currTabIndex = p5.props.currTabIndex
	local formFactor = p5.props.formFactor
	local windowWidth = p5.props.windowWidth
	local frameHeight = p5.props.frameHeight
	local layoutOrder = p5.props.layoutOrder
	local textWidths = p5.state.textWidths
	local totalTextLength = p5.state.totalTextLength
	local totalTabCount = p5.state.totalTabCount
	local t = {}
	local var22 = (windowWidth - totalTextLength) / totalTabCount
	local var23 = var22 % 1 * totalTabCount / 2
	local var24 = var22 < tabOverlapThreshold and windowWidth > 0
	local var25 = formFactor == constantsModule.FormFactor.Small
	
	if tabList then
		if var24 or var25 then
			local t_1 = {}
			local layoutOrder_1 = tabList[currTabIndex].layoutOrder
			
			for i, v in pairs(tabList) do
				t_1[v.layoutOrder] = i
			end
			if var25 then
				return roactModule.createElement(fullScreenDropDownButtonModule, {
					buttonSize = UDim2.new(0, tabDropDownWidth, 0, frameHeight),
					dropDownList = t_1,
					selectedIndex = layoutOrder_1,
					onSelection = p5.onTabButtonClicked,
					layoutOrder = layoutOrder
				})
			elseif var24 then
				return roactModule.createElement(dropDownModule, {
					buttonSize = UDim2.new(0, tabDropDownWidth, 0, frameHeight),
					dropDownList = t_1,
					selectedIndex = layoutOrder_1,
					onSelection = p5.onTabButtonClicked
				})
			end
		else
			for i, v in pairs(tabList) do
				if textWidths[i] then
					t[i] = roactModule.createElement(tabRowButtonModule, {
						index = v.layoutOrder,
						name = i,
						padding = var22,
						textWidth = if var24 then tabDropDownWidth else textWidths[i],
						isSelected = i == currTabIndex,
						layoutOrder = v.layoutOrder,
						onTabButtonClicked = p5.onTabButtonClicked
					})
				end
			end
		end
		t.UIListLayout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			FillDirection = Enum.FillDirection.Horizontal
		})
	end
	return roactModule.createElement("Frame", {
		Transparency = 1,
		Size = UDim2.new(1, 0, 0, frameHeight),
		Position = UDim2.new(0, var23, 0, 0),
		LayoutOrder = layoutOrder
	}, t)
end

return roactRoduxModule.UNSTABLE_connect2(function(p6, _) --[[ line: 146 | named "mapStateToProps" ]]
	return {
		tabList = p6.MainView.tabList,
		currTabIndex = p6.MainView.currTabIndex
	}
end, function(p7) --[[ line: 153 | named "mapDispatchToProps" ]]
	-- upvalues: setActiveTabModule (ref)
	return {
		dispatchSetActiveTab = function(value, p8) --[[ line: 155 ]]
			-- upvalues: p7 (ref), setActiveTabModule (copy)
			p7(setActiveTabModule(value, p8))
		end
	}
end)(tabRowContainer)