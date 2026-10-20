local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local ReactModule = require(Parent1.React)
local RoactGamepadModule = require(Parent1.RoactGamepad)
local UseStyleModule = require(Parent.Core.Style.useStyle)
local CursorContextModule = require(script.Parent.CursorContext)
local CursorComponentModule = require(script.Parent.CursorComponent)
local CursorTypeModule = require(script.Parent.CursorType)

local function _(p1, p2, p3): string
	return string.format("%f %f %f %f", p1.Scale, p1.Offset, p2, p3)
end

local function v12(Text: string)
	local Scale = 1e999
	local v1 = 1e999
	local v2 = 1e999
	local v3 = 1e999
	
	for i, value in string.split(Text, " ") do
		local Number: number? = tonumber(value)
		
		if Number ~= nil then
			if i == 1 then
				Scale = Number
			elseif i == 2 then
				v1 = Number
			elseif i == 3 then
				v2 = Number
			elseif i == 4 then
				v3 = Number
			end
		end
	end
	assert(Scale ~= 1e999 and (v1 ~= 1e999 and (v2 ~= 1e999 and v3 ~= 1e999)), "Error! Not all parameters are decoded.")
	
	return UDim.new(Scale, (math.max(0, v1 + v2))), v2, v3
end

return function(p1)
	-- upvalues: ReactModule (copy), RoactGamepadModule (copy), UseStyleModule (copy), CryoModule (copy), CursorTypeModule (copy), v12 (copy), CursorComponentModule (copy), CoreGui (copy), GuiService (copy), CursorContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local Ref = ReactModule.createRef()
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local Tokens = UseStyleModule().Tokens
	
	local function GetCursor(p2, p3: number, Thick: number)
		-- upvalues: Tokens (copy), UseStateResult (copy), UseStateResult2 (copy), CryoModule (upval), UseRefCacheResult (copy)
		warn("UIBlox's SelectionCursor is deprecated and should not be used anymore.")
		local _UDim = if p2 ~= nil then p2 else UDim.new(0, 0)
		local Thick1 = nil
		
		if Thick == nil then
			Thick1 = Tokens.Stroke.Thick
		else
			assert(Thick > 0, "Error! borderWidth should be larger than 0.")
			Thick1 = Thick
		end
		local Formatted = string.format("%f %f %f %f", _UDim.Scale, _UDim.Offset, if p3 == nil then Tokens.Size.Size_150 - Thick1 else p3 - Thick1, Thick1)
		
		if UseStateResult[Formatted] == nil then
			UseStateResult2(CryoModule.Dictionary.join(UseStateResult, { [Formatted] = true }))
		end
		return UseRefCacheResult[Formatted]
	end
	
	local function GetCursorByType(p2)
		-- upvalues: CursorTypeModule (upval), UseStateResult1 (copy), UseStateResult2_1 (copy), CryoModule (upval), UseRefCacheResult (copy)
		assert(CursorTypeModule.isEnumValue(p2), ("Error! expected a CursorType enum, got %s"):format((tostring(p2))))
		warn("UIBlox's SelectionCursor is deprecated and should not be used anymore.")
		
		if UseStateResult1[p2] == nil then
			UseStateResult2_1(CryoModule.Dictionary.join(UseStateResult1, { [p2] = true }))
		end
		return UseRefCacheResult[p2]
	end
	
	local function v28()
		-- upvalues: UseStateResult (copy), UseRefCacheResult (copy), UseStateResult3 (copy), v12 (upval), ReactModule (upval), CursorComponentModule (upval), UseStateResult1 (copy)
		local Elements = {}
		
		for i, _ in pairs(UseStateResult) do
			local IsCurrentMatch: boolean = UseRefCacheResult[i] ~= nil and (UseStateResult3 ~= nil and UseRefCacheResult[i].current == UseStateResult3)
			local CornerRadius, Offset, BorderWidth = v12(i)
			Elements[i] = ReactModule.createElement(CursorComponentModule, {
				ref = UseRefCacheResult[i],
				isVisible = IsCurrentMatch,
				cornerRadius = CornerRadius,
				offset = Offset,
				borderWidth = BorderWidth
			})
		end
		for i1, _ in pairs(UseStateResult1) do
			Elements[i1] = ReactModule.createElement(i1.rawValue(), {
				ref = UseRefCacheResult[i1],
				isVisible = UseRefCacheResult[i1] ~= nil and (UseStateResult3 ~= nil and UseRefCacheResult[i1].current == UseStateResult3)
			})
		end
		return Elements
	end
	
	ReactModule.useEffect(function()
		-- upvalues: Ref (copy), CoreGui (upval), GuiService (upval), UseStateResult2_2 (copy)
		if Ref.current == nil or not Ref.current:IsDescendantOf(game) then return end
		local IsDescendantOf = Ref.current:IsDescendantOf(CoreGui)
		
		local function setUpSelectionImageObjectConnection()
			-- upvalues: IsDescendantOf (copy), GuiService (upval), UseStateResult2_2 (upval)
			return if IsDescendantOf then GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: GuiService (upval), UseStateResult2_2 (upval)
				if GuiService.SelectedCoreObject == nil then
					UseStateResult2_2(nil)
					
					return
				else
					UseStateResult2_2(GuiService.SelectedCoreObject.SelectionImageObject)
				end
			end) else GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
				-- upvalues: GuiService (upval), UseStateResult2_2 (upval)
				if GuiService.SelectedObject == nil then
					UseStateResult2_2(nil)
					
					return
				else
					UseStateResult2_2(GuiService.SelectedObject.SelectionImageObject)
				end
			end)
		end
		
		local SetUpSelectionImageObjectConnectionResult = setUpSelectionImageObjectConnection()
		local AncestryChangedConnection = Ref.current.AncestryChanged:Connect(function()
			-- upvalues: SetUpSelectionImageObjectConnectionResult (ref), setUpSelectionImageObjectConnection (copy)
			SetUpSelectionImageObjectConnectionResult:Disconnect()
			SetUpSelectionImageObjectConnectionResult = setUpSelectionImageObjectConnection()
		end)
		
		return function()
			-- upvalues: SetUpSelectionImageObjectConnectionResult (ref), AncestryChangedConnection (copy)
			SetUpSelectionImageObjectConnectionResult:Disconnect()
			AncestryChangedConnection:Disconnect()
		end
	end, {})
	
	return ReactModule.createElement(CursorContextModule.Provider, {
		value = { getCursor = GetCursor, getCursorByType = GetCursorByType }
	}, CryoModule.Dictionary.join({
		InvisibleContainer = ReactModule.createElement("Frame", { Visible = false, Size = UDim2.new(0, 0, 0, 0), ref = Ref }, (v28()))
	}, p1.children))
end