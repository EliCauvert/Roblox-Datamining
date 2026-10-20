local UtilsModule = require(script.Parent.Parent.utils)
local BtnCenterFunction = UtilsModule.btnCenter
local IsOnScreenFunction = UtilsModule.isOnScreen

local function getControlLabel(Object)
	local Text = nil
	for _, Label in ipairs(Object:GetChildren()) do
		if Label:IsA("TextLabel") and Label.Name:match("Label") then
			Text = Label.Text
			
			if Text ~= "" and Text ~= "Set by Developer" then
				return Text
			end
		end
	end
	local LabelContainer = Object:FindFirstChild("LabelContainer")
	
	if LabelContainer then
		local Label1 = LabelContainer:FindFirstChild("Label")
		
		if Label1 and Label1:IsA("TextLabel") then
			return Label1.Text
		end
	end
	local Text1 = nil
	for _, Frame in ipairs(Object:GetChildren()) do
		if Frame:IsA("Frame") and Frame.Name:find("Label") then
			for _, Label2 in ipairs(Frame:GetChildren()) do
				if Label2:IsA("TextLabel") and Label2.Name:match("Label") then
					Text1 = Label2.Text
					
					if Text1 ~= "" then
						return Text1
					end
				end
			end
		end
	end
	return Object.Name:gsub("Frame$", "")
end

local function isSectionHeader(Frame)
	if not Frame.Name:find("Header") then
		return false, nil
	end
	local Text = nil
	for _, Label in ipairs(Frame:GetDescendants()) do
		if Label:IsA("TextLabel") then
			Text = Label.Text
			
			if Text and Text ~= "" then
				return true, Text
			end
		end
	end
	return true, nil
end

local function _(p1): boolean
	return p1.Name:find("Divider") ~= nil
end

local function collectSignals(Parent)
	local t = {}
	
	for _, descendant in ipairs(Parent:GetDescendants()) do
		local Name: string = descendant.Name
		
		if descendant:IsA("UIDragDetector") then
			t.dragDetector = t.dragDetector or descendant
		elseif descendant:IsA("GuiObject") then
			local Lowered: string = Name:lower()
			
			if Name == "StepsContainer" then
				t.stepsContainer = t.stepsContainer or descendant
			elseif Name == "Bar" then
				t.bar = t.bar or descendant
			elseif Name == "Fill" then
				t.fill = t.fill or descendant
			elseif Name == "Knob" then
				t.knob = t.knob or descendant
			elseif Lowered:find("slider") then
				t.sliderLike = t.sliderLike or descendant
			elseif Lowered:find("leftbutton") then
				t.leftBtn = t.leftBtn or descendant
			elseif Lowered:find("rightbutton") then
				t.rightBtn = t.rightBtn or descendant
			elseif Lowered:find("leftarrow") then
				t.leftArrow = t.leftArrow or descendant
			elseif Lowered:find("rightarrow") then
				t.rightArrow = t.rightArrow or descendant
			end
			if descendant:IsA("GuiButton") and (Name:find("DropDown") or Name:find("Dropdown")) then
				t.dropdownBtn = t.dropdownBtn or descendant
			end
		end
		if descendant:IsA("TextLabel") then
			if descendant.Text == "chevron-large-down" then
				t.chevronDown = t.chevronDown or descendant
			elseif Name:find("Selection") and descendant.Visible then
				t.selectionLabel = t.selectionLabel or descendant
			elseif Name == "ValueText" then
				t.valueText = t.valueText or descendant
			end
		end
	end
	return t
end

local function classifyControl(Parent)
	-- upvalues: collectSignals (copy), BtnCenterFunction (copy)
	local t = {}
	local CollectSignalsResult = collectSignals(Parent)
	
	if CollectSignalsResult.dragDetector or CollectSignalsResult.stepsContainer or CollectSignalsResult.sliderLike then
		local Text = ""
		
		if CollectSignalsResult.stepsContainer then
			local Count = 0
			local Count1 = 0
			
			for _, Button in ipairs(CollectSignalsResult.stepsContainer:GetChildren()) do
				if Button:IsA("ImageButton") then
					Count += 1
					local BackgroundColor3 = Button.BackgroundColor3
					
					if 0.299 * BackgroundColor3.R + 0.587 * BackgroundColor3.G + 0.114 * BackgroundColor3.B > 0.5 then
						Count1 += 1
					end
				end
			end
			if Count > 0 then
				Text = ("%d/%d"):format(Count1, Count)
			end
		end
		if CollectSignalsResult.dragDetector then
			if CollectSignalsResult.bar and CollectSignalsResult.fill then
				local X: number = CollectSignalsResult.bar.AbsoluteSize.X
				local X1 = CollectSignalsResult.fill.AbsoluteSize.X
				
				if X > 0 then
					Text = ("%d%%"):format((math.round(X1 / X * 100)))
				end
			end
			if CollectSignalsResult.knob then
				t["drag knob"] = BtnCenterFunction(CollectSignalsResult.knob)
			end
		end
		if CollectSignalsResult.leftBtn and CollectSignalsResult.leftBtn.Visible then
			t["decrease (-)"] = BtnCenterFunction(CollectSignalsResult.leftBtn)
		end
		if CollectSignalsResult.rightBtn and CollectSignalsResult.rightBtn.Visible then
			t["increase (+)"] = BtnCenterFunction(CollectSignalsResult.rightBtn)
		end
		return "slider", Text, t
	else
		local LeftBtn = CollectSignalsResult.leftBtn or CollectSignalsResult.leftArrow
		local RightBtn = CollectSignalsResult.rightBtn or CollectSignalsResult.rightArrow
		
		if LeftBtn and RightBtn then
			local Text = if CollectSignalsResult.selectionLabel then CollectSignalsResult.selectionLabel.Text else ""
			
			if Text == "" and CollectSignalsResult.valueText then
				Text = CollectSignalsResult.valueText.Text
			end
			if LeftBtn.Visible then
				t["prev (<)"] = BtnCenterFunction(LeftBtn)
			end
			if RightBtn.Visible then
				t["next (>)"] = BtnCenterFunction(RightBtn)
			end
			return "selector", Text, t
		else
			local DropdownBtn = CollectSignalsResult.dropdownBtn
			
			if not DropdownBtn and CollectSignalsResult.chevronDown then
				local Parent1 = CollectSignalsResult.chevronDown.Parent
				while Parent1 and Parent1 ~= Parent do
					if not Parent1:IsA("GuiButton") then
						Parent1 = Parent1.Parent
						continue
					end
					DropdownBtn = Parent1
					break
				end
			end
			if DropdownBtn then
				local Text = ""
				local DropDownFrameTextLabel = DropdownBtn:FindFirstChild("DropDownFrameTextLabel")
				
				if DropDownFrameTextLabel and DropDownFrameTextLabel:IsA("TextLabel") then
					Text = DropDownFrameTextLabel.Text
				end
				if Text == "" then
					local TextLabel = DropdownBtn:FindFirstChildWhichIsA("TextLabel", true)
					
					if TextLabel and TextLabel.Name == "Text" then
						Text = TextLabel.Text
					end
				end
				if DropdownBtn:IsA("GuiObject") then
					t.open = BtnCenterFunction(DropdownBtn)
				end
				return "dropdown", Text, t
			else
				if CollectSignalsResult.knob then
					local Parent2 = CollectSignalsResult.knob.Parent
					while Parent2 and (Parent2 ~= Parent and not Parent2:IsA("ImageButton")) do
						Parent2 = Parent2.Parent
					end
					if Parent2 and Parent2:IsA("ImageButton") then
						local IsXBelow = Parent2.AbsolutePosition.X + Parent2.AbsoluteSize.X / 2 <= CollectSignalsResult.knob.AbsolutePosition.X
						t.toggle = BtnCenterFunction(Parent2)
						
						return "toggle", if IsXBelow then "On" else "Off", t
					end
				end
				local TextLabel = nil
				for _, Button1 in ipairs(Parent:GetChildren()) do
					if Button1:IsA("GuiButton") then
						TextLabel = Button1:FindFirstChildWhichIsA("TextLabel", true)
						
						if TextLabel and TextLabel.Text ~= "" then
							t.click = BtnCenterFunction(Button1)
							
							return "button", TextLabel.Text, t
						end
					end
				end
				return "unknown", "", t
			end
		end
	end
end

local function collectControls(Frame, AncestorScrollFrame, List, p1)
	-- upvalues: UtilsModule (copy), isSectionHeader (copy), classifyControl (copy), getControlLabel (copy), IsOnScreenFunction (copy), collectControls (copy)
	local v1 = p1
	
	for _, Frame1 in ipairs((UtilsModule.sortChildrenByLayoutOrder(Frame:GetChildren()))) do
		if Frame1:IsA("GuiObject") and Frame1.Visible and Frame1.Name:find("Divider") == nil then
			local IsSectionHeader, IsSectionHeader2 = isSectionHeader(Frame1)
			
			if not IsSectionHeader then
				local ClassifyControlResult, ClassifyControlResult2, ClassifyControlResult3 = classifyControl(Frame1)
				
				if ClassifyControlResult == "unknown" then
					if Frame1:IsA("Frame") then
						collectControls(Frame1, AncestorScrollFrame, List, v1)
						continue
					end
					continue
				end
				local ControlLabel = getControlLabel(Frame1)
				local IsOnScreen = IsOnScreenFunction(Frame1, AncestorScrollFrame)
				local List1 = {}
				
				if v1 ~= "" then
					table.insert(List1, ("[%s]"):format(v1))
				end
				table.insert(List1, ("\"%s\""):format(ControlLabel))
				table.insert(List1, ("  type: %s"):format(ClassifyControlResult))
				
				if ClassifyControlResult2 ~= "" then
					table.insert(List1, ("  value: %s"):format(ClassifyControlResult2))
				end
				if not IsOnScreen then
					table.insert(List1, "  *** OFF-SCREEN (scroll to see, then re-query for updated coords)")
				end
				for i, value in pairs(ClassifyControlResult3) do
					if IsOnScreen then
						table.insert(List1, ("  %s → click (%s)"):format(i, value))
					else
						table.insert(List1, ("  %s → (scroll first)"):format(i))
					end
				end
				table.insert(List, {
					layoutOrder = Frame1.LayoutOrder,
					text = table.concat(List1, "\n")
				})
			elseif IsSectionHeader2 then
				v1 = IsSectionHeader2
			end
		end
	end
end

return {
	description = "List all interactive controls in a container. Auto-discovers selectors (<> arrows), sliders, toggles, dropdowns, and buttons by their intrinsic properties. Returns name, type, current value, section header, and click coordinates for each interaction. Ideal for settings pages, option panels, or any UI with multiple controls.",
	params = {
		{
			name = "path",
			desc = "DataModel path to the container holding the controls. For ESC menu settings use: game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.Page.PageViewClipper.PageView.PageViewInnerFrame.Page",
			required = false
		},
		{
			name = "root",
			desc = "Alias for \"path\" — the container to scan. Default: auto-detects the ESC menu settings page if open.",
			required = false
		},
		{
			name = "limit",
			required = false,
			desc = ("max results (default %d). Useful when verifying just the first few rows after scrolling."):format(UtilsModule.MAX_RESULTS)
		}
	},
	call = function(p2): string
		-- upvalues: UtilsModule (copy), collectControls (copy)
		local Path = p2.path or p2.root
		local ResolveInstanceResult = nil
		
		if Path then
			ResolveInstanceResult = UtilsModule.resolveInstance(Path)
			
			if not ResolveInstanceResult then
				return "ERROR: could not resolve path \"" .. tostring(Path) .. "\""
			end
		else
			ResolveInstanceResult = UtilsModule.resolveInstance("CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.Page.PageViewClipper.PageView.PageViewInnerFrame.Page")
			
			if not ResolveInstanceResult then
				return "ERROR: no path provided and ESC menu settings page not found. Open the ESC menu to the Settings tab, or provide a 'path' parameter."
			end
		end
		assert(ResolveInstanceResult, "container should be resolved by this point")
		local List = {}
		collectControls(ResolveInstanceResult, UtilsModule.findAncestorScrollFrame(ResolveInstanceResult), List, "")
		
		if #List == 0 then
			return "No interactive controls found in " .. ResolveInstanceResult:GetFullName()
		end
		table.sort(List, function(A, B): boolean
			return A.layoutOrder < B.layoutOrder
		end)
		local Number: number = tonumber(p2.limit) or UtilsModule.MAX_RESULTS
		local Flag = false
		
		if Number < #List then
			Flag = true
			local t = {}
			
			for i = 1, Number do
				t[i] = List[i]
			end
			List = t
		end
		local List1 = {
			if Flag then ("Showing first %d control(s) (limited) in %s:\n"):format(#List, ResolveInstanceResult:GetFullName()) else ("Found %d control(s) in %s:\n"):format(#List, ResolveInstanceResult:GetFullName())
		}
		
		for _, value in ipairs(List) do
			table.insert(List1, value.text)
		end
		return table.concat(List1, "\n\n")
	end
}