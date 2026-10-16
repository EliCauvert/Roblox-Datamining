local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local reactModule = require(parent_1.React)
local roactGamepadModule = require(parent_1.RoactGamepad)
local useStyleModule = require(parent.Core.Style.useStyle)
local cursorContextModule = require(script.Parent.CursorContext)
local cursorComponentModule = require(script.Parent.CursorComponent)
local cursorTypeModule = require(script.Parent.CursorType)

local _ = function(p1, p2, p3)
	return string.format("%f %f %f %f", p1.Scale, p1.Offset, p2, p3)
end

local var1 = function(p1)
	local var2 = 1e999
	local var3 = 1e999
	local var4 = 1e999
	local var5 = 1e999
	
	for i, v in string.split(p1, " ") do
		local var6 = tonumber(v)
		
		if var6 ~= nil then
			if i == 1 then
				var2 = var6
			elseif i == 2 then
				var3 = var6
			elseif i == 3 then
				var4 = var6
			elseif i == 4 then
				var5 = var6
			end
		end
	end
	assert(var2 ~= 1e999 and (var3 ~= 1e999 and (var4 ~= 1e999 and var5 ~= 1e999)), "Error! Not all parameters are decoded.")
	
	return UDim.new(var2, math.max(0, var3 + var4)), var4, var5
end

return function(p2)
	-- upvalues: reactModule (ref), roactGamepadModule (ref), useStyleModule (ref), cryoModule (ref), cursorTypeModule (ref), var1 (ref), cursorComponentModule (ref), coreGuiService (ref), guiService (ref), cursorContextModule (ref)
	local var7, var8 = reactModule.useState({})
	local var9, var10 = reactModule.useState({})
	local var11 = reactModule.createRef()
	local var12, var13 = reactModule.useState(nil)
	local var14 = roactGamepadModule.useRefCache()
	local selectionCursor = useStyleModule().Tokens.Component.SelectionCursor
	
	local var15 = function(p3, p4, p5)
		-- upvalues: selectionCursor (ref), var7 (ref), var8 (ref), cryoModule (copy), var14 (ref)
		local var16
		warn("UIBlox's SelectionCursor is deprecated and should not be used anymore.")
		local var17 = if p3 ~= nil then p3 else UDim.new(0, 0)
		local _ = 0
		
		if p5 == nil then
			var16 = selectionCursor.BorderWidth
		else
			assert(p5 > 0, "Error! borderWidth should be larger than 0.")
			var16 = p5
		end
		local formattedText = string.format("%f %f %f %f", var17.Scale, var17.Offset, if p4 ~= nil then selectionCursor.Offset - var16 else p4 - var16, var16)
		
		if var7[formattedText] == nil then
			var8(cryoModule.Dictionary.join(var7, { [formattedText] = true }))
		end
		return var14[formattedText]
	end
	
	local var16 = function(p3)
		-- upvalues: cursorTypeModule (copy), var9 (ref), var10 (ref), cryoModule (copy), var14 (ref)
		assert(cursorTypeModule.isEnumValue(p3), ("Error! expected a CursorType enum, got %s"):format(tostring(p3)))
		warn("UIBlox's SelectionCursor is deprecated and should not be used anymore.")
		
		if var9[p3] == nil then
			var10(cryoModule.Dictionary.join(var9, { [p3] = true }))
		end
		return var14[p3]
	end
	
	local var17 = function()
		-- upvalues: var7 (ref), var14 (ref), var12 (ref), var1 (copy), reactModule (copy), cursorComponentModule (copy), var9 (ref)
		local t = {}
		
		for i, v in pairs(var7) do
			local var18 = var14[i] ~= nil and (var12 ~= nil and var14[i].current == var12)
			local var19, var20, var21 = var1(i)
			t[i] = reactModule.createElement(cursorComponentModule, {
				ref = var14[i],
				isVisible = var18,
				cornerRadius = var19,
				offset = var20,
				borderWidth = var21
			})
		end
		for i_1, v in pairs(var9) do
			t[i_1] = reactModule.createElement(i_1.rawValue(), {
				ref = var14[i_1],
				isVisible = var14[i_1] ~= nil and (var12 ~= nil and var14[i_1].current == var12)
			})
		end
		return t
	end
	
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), coreGuiService (copy), guiService (copy), var13 (ref)
		if var11.current == nil or not var11.current:IsDescendantOf(game) then
			return
		end
		local var22 = var11.current:IsDescendantOf(coreGuiService)
		
		local function setUpSelectionImageObjectConnection()
			-- upvalues: var22 (ref), guiService (copy), var13 (copy)
			return if var22 then guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: guiService (copy), var13 (copy)
				if guiService.SelectedCoreObject == nil then
					var13(nil)
					
					return
				end
				var13(guiService.SelectedCoreObject.SelectionImageObject)
			end) else guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
				-- upvalues: guiService (copy), var13 (copy)
				if guiService.SelectedObject == nil then
					var13(nil)
					
					return
				end
				var13(guiService.SelectedObject.SelectionImageObject)
			end)
		end
		
		local var23 = setUpSelectionImageObjectConnection()
		local ancestryChangedConnection = var11.current.AncestryChanged:Connect(function()
			-- upvalues: var23 (write), setUpSelectionImageObjectConnection (ref)
			var23:Disconnect()
			var23 = setUpSelectionImageObjectConnection()
		end)
		
		return function()
			-- upvalues: var23 (write), ancestryChangedConnection (ref)
			var23:Disconnect()
			ancestryChangedConnection:Disconnect()
		end
	end, {})
	
	return reactModule.createElement(cursorContextModule.Provider, { value = { getCursor = var15, getCursorByType = var16 } }, cryoModule.Dictionary.join({
		InvisibleContainer = reactModule.createElement("Frame", {
			Visible = false,
			Size = UDim2.new(0, 0, 0, 0),
			ref = var11
		}, var17())
	}, p2.children))
end