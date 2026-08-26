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

local function initTabList(p1)
	-- upvalues: textService (ref), constantsModule (ref)
	local t = {}
	local var1 = 0
	local var2 = 0
	
	for i, v in pairs(p1) do
		local var3 = textService:GetTextSize(i, constantsModule.DefaultFontSize.TabBar, constantsModule.Font.TabBar, Vector2.new(0, 0))
		t[i] = var3.X
		var1 += var3.X
		var2 += 1
	end
	return t, var1, var2
end

function tabRowContainer.init(p2)
	-- upvalues: initTabList (ref)
	local var4, var5, var6 = initTabList(p2.props.tabList)
	p2.state = {
		currContainerWidth = 0,
		textWidths = var4,
		totalTextLength = var5,
		totalTabCount = var6
	}
	
	function p1.onTabButtonClicked(p3)
		-- upvalues: p2 (ref)
		for i, v in pairs(p2.props.tabList) do
			if v.layoutOrder == p3 then
				p2.props.dispatchSetActiveTab(i, v.hasClientServer)
				
				return
			end
		end
	end
end

function tabRowContainer.didUpdate(p3, p4, _)
	-- upvalues: initTabList (ref)
	if p4.tabList ~= p3.props.tabList then
		local var7, var8, var9 = initTabList(p3.props.tabList)
		p3:setState({
			textWidths = var7,
			totalTextLength = var8,
			totalTabCount = var9
		})
	end
end

function tabRowContainer.render(p3)
	-- upvalues: tabOverlapThreshold (ref), constantsModule (ref), roactModule (ref), fullScreenDropDownButtonModule (ref), tabDropDownWidth (ref), dropDownModule (ref), tabRowButtonModule (ref)
	local tabList = p3.props.tabList
	local currTabIndex = p3.props.currTabIndex
	local formFactor = p3.props.formFactor
	local windowWidth = p3.props.windowWidth
	local frameHeight = p3.props.frameHeight
	local layoutOrder = p3.props.layoutOrder
	local textWidths = p3.state.textWidths
	local totalTextLength = p3.state.totalTextLength
	local totalTabCount = p3.state.totalTabCount
	local t = {}
	local var7 = (windowWidth - totalTextLength) / totalTabCount
	local var8 = var7 % 1 * totalTabCount / 2
	local var9 = var7 < tabOverlapThreshold and windowWidth > 0
	local var10 = formFactor == constantsModule.FormFactor.Small
	
	if tabList then
		if var9 or var10 then
			local t_1 = {}
			local layoutOrder_1 = tabList[currTabIndex].layoutOrder
			
			for i, v in pairs(tabList) do
				t_1[v.layoutOrder] = i
			end
			if var10 then
				return roactModule.createElement(fullScreenDropDownButtonModule, {
					buttonSize = UDim2.new(0, tabDropDownWidth, 0, frameHeight),
					dropDownList = t_1,
					selectedIndex = layoutOrder_1,
					onSelection = p3.onTabButtonClicked,
					layoutOrder = layoutOrder
				})
			elseif var9 then
				return roactModule.createElement(dropDownModule, {
					buttonSize = UDim2.new(0, tabDropDownWidth, 0, frameHeight),
					dropDownList = t_1,
					selectedIndex = layoutOrder_1,
					onSelection = p3.onTabButtonClicked
				})
			end
		else
			for i, v in pairs(tabList) do
				if textWidths[i] then
					t[i] = roactModule.createElement(tabRowButtonModule, {
						index = v.layoutOrder,
						name = i,
						padding = var7,
						textWidth = if var9 then tabDropDownWidth else textWidths[i],
						isSelected = i == currTabIndex,
						layoutOrder = v.layoutOrder,
						onTabButtonClicked = p3.onTabButtonClicked
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
		Position = UDim2.new(0, var8, 0, 0),
		LayoutOrder = layoutOrder
	}, t)
end

return roactRoduxModule.UNSTABLE_connect2(function(p4, _)
	return {
		tabList = p4.MainView.tabList,
		currTabIndex = p4.MainView.currTabIndex
	}
end, function(p4)
	-- upvalues: setActiveTabModule (ref)
	return {
		dispatchSetActiveTab = function(value, p5)
			-- upvalues: p4 (ref), setActiveTabModule (copy)
			p4(setActiveTabModule(value, p5))
		end
	}
end)(tabRowContainer)