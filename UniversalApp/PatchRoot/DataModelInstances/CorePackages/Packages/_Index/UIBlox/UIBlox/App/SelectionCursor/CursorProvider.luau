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

local _ = function(p0, p1, p2) --[[ line: 20 ]]
	return string.format("%f %f %f %f", p0.Scale, p0.Offset, p1, p2)
end

local var9 = function(p3) --[[ line: 24 ]]
	local var10 = 1e999
	local var11 = 1e999
	local var12 = 1e999
	local var13 = 1e999
	
	for i, v in string.split(p3, " ") do
		local var14 = tonumber(v)
		
		if var14 ~= nil then
			if i == 1 then
				var10 = var14
			elseif i == 2 then
				var11 = var14
			elseif i == 3 then
				var12 = var14
			elseif i == 4 then
				var13 = var14
			end
		end
	end
	assert(var10 ~= 1e999 and (var11 ~= 1e999 and (var12 ~= 1e999 and var13 ~= 1e999)), "Error! Not all parameters are decoded.")
	
	return UDim.new(var10, math.max(0, var11 + var12)), var12, var13
end

return function(p4) --[[ line: 53 ]]
	-- upvalues: reactModule (ref), roactGamepadModule (ref), useStyleModule (ref), cryoModule (ref), cursorTypeModule (ref), var9 (ref), cursorComponentModule (ref), coreGuiService (ref), guiService (ref), cursorContextModule (ref)
	local var15, var16 = reactModule.useState({})
	local var17, var18 = reactModule.useState({})
	local var19 = reactModule.createRef()
	local var20, var21 = reactModule.useState(nil)
	local var22 = roactGamepadModule.useRefCache()
	local selectionCursor = useStyleModule().Tokens.Component.SelectionCursor
	
	local var23 = function(p5, p6, p7) --[[ line: 61 ]]
		-- upvalues: selectionCursor (ref), var15 (ref), var16 (ref), cryoModule (copy), var22 (ref)
		local var27
		warn("UIBlox's SelectionCursor is deprecated and should not be used anymore.")
		local var26 = if p5 ~= nil then p5 else UDim.new(0, 0)
		local _ = 0
		
		if p7 == nil then
			var27 = selectionCursor.BorderWidth
		else
			assert(p7 > 0, "Error! borderWidth should be larger than 0.")
			var27 = p7
		end
		local formattedText = string.format("%f %f %f %f", var26.Scale, var26.Offset, if p6 ~= nil then selectionCursor.Offset - var27 else p6 - var27, var27)
		
		if var15[formattedText] == nil then
			var16(cryoModule.Dictionary.join(var15, { [formattedText] = true }))
		end
		return var22[formattedText]
	end
	
	local var24 = function(p8) --[[ line: 96 ]]
		-- upvalues: cursorTypeModule (copy), var17 (ref), var18 (ref), cryoModule (copy), var22 (ref)
		assert(cursorTypeModule.isEnumValue(p8), ("Error! expected a CursorType enum, got %s"):format(tostring(p8)))
		warn("UIBlox's SelectionCursor is deprecated and should not be used anymore.")
		
		if var17[p8] == nil then
			var18(cryoModule.Dictionary.join(var17, { [p8] = true }))
		end
		return var22[p8]
	end
	
	local var25 = function() --[[ line: 112 ]]
		-- upvalues: var15 (ref), var22 (ref), var20 (ref), var9 (copy), reactModule (copy), cursorComponentModule (copy), var17 (ref)
		local t = {}
		
		for i, v in pairs(var15) do
			local var30 = var22[i] ~= nil and (var20 ~= nil and var22[i].current == var20)
			local var31, var32, var33 = var9(i)
			t[i] = reactModule.createElement(cursorComponentModule, {
				ref = var22[i],
				isVisible = var30,
				cornerRadius = var31,
				offset = var32,
				borderWidth = var33
			})
		end
		for i_1, v in pairs(var17) do
			t[i_1] = reactModule.createElement(i_1.rawValue(), {
				ref = var22[i_1],
				isVisible = var22[i_1] ~= nil and (var20 ~= nil and var22[i_1].current == var20)
			})
		end
		return t
	end
	
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: var19 (ref), coreGuiService (copy), guiService (copy), var21 (ref)
		if var19.current == nil or not var19.current:IsDescendantOf(game) then
			return
		end
		local var34 = var19.current:IsDescendantOf(coreGuiService)
		
		local function setUpSelectionImageObjectConnection() --[[ line: 152 ]]
			-- upvalues: var34 (ref), guiService (copy), var21 (copy)
			return if var34 then guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 157 ]]
				-- upvalues: guiService (copy), var21 (copy)
				if guiService.SelectedCoreObject == nil then
					var21(nil)
					
					return
				end
				var21(guiService.SelectedCoreObject.SelectionImageObject)
			end) else guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ line: 165 ]]
				-- upvalues: guiService (copy), var21 (copy)
				if guiService.SelectedObject == nil then
					var21(nil)
					
					return
				end
				var21(guiService.SelectedObject.SelectionImageObject)
			end)
		end
		
		local var36 = setUpSelectionImageObjectConnection()
		local ancestryChangedConnection = var19.current.AncestryChanged:Connect(function() --[[ line: 176 ]]
			-- upvalues: var36 (write), setUpSelectionImageObjectConnection (ref)
			var36:Disconnect()
			var36 = setUpSelectionImageObjectConnection()
		end)
		
		return function() --[[ line: 186 ]]
			-- upvalues: var36 (write), ancestryChangedConnection (ref)
			var36:Disconnect()
			ancestryChangedConnection:Disconnect()
		end
	end, {})
	
	return reactModule.createElement(cursorContextModule.Provider, { value = { getCursor = var23, getCursorByType = var24 } }, cryoModule.Dictionary.join({
		InvisibleContainer = reactModule.createElement("Frame", {
			Visible = false,
			Size = UDim2.new(0, 0, 0, 0),
			ref = var19
		}, var25())
	}, p4.children))
end