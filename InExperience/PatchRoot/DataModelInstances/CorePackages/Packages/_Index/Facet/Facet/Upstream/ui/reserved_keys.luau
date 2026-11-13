local _ = require("./types")
local Frozen = table.freeze({ Tab = true, Escape = true })
local Frozen1 = table.freeze({
	"LeftControl", "RightControl", "LeftAlt", "RightAlt", "LeftMeta", "RightMeta",
	"LeftSuper", "RightSuper"
})
local self = setmetatable({}, { __mode = "k" })

local function _(p1, Node)
	local Node1 = p1.node
	
	return Node1 ~= nil and (Node ~= nil and (Node == Node1 or Node:IsDescendantOf(Node1)))
end

local function dispatch(UserInputService: UserInputService, p1, Input)
	-- upvalues: Frozen (copy), Frozen1 (copy)
	local Name = if Input.KeyCode then Input.KeyCode.Name else nil
	
	if Name == nil or not Frozen[Name] then return end
	if not p1.ending[Name] then
		local KeyCode = Input.KeyCode
		local Connection = nil
		Connection = UserInputService.InputEnded:Connect(function(Input)
			-- upvalues: KeyCode (copy), Connection (ref), p1 (copy), Name (copy)
			if Input.KeyCode == KeyCode then
				Connection:Disconnect()
				p1.ending[Name] = nil
				
				for _, value in table.clone(p1.handlers) do
					if value.keys[Name] then
						value.release()
					end
				end
			end
		end)
		p1.ending[Name] = Connection
	end
	if UserInputService.IsKeyDown then
		for _, value in Frozen1 do
			local KeyCode1 = p1.keyCodes[value]
			
			if KeyCode1 and UserInputService:IsKeyDown(KeyCode1) then return end
		end
	end
	local FocusedTextBox = if UserInputService.GetFocusedTextBox then UserInputService:GetFocusedTextBox() else nil
	local Copy = table.clone(p1.handlers)
	local t = {}
	
	for _, value1 in Copy do
		local SelectedFunction = value1.selected
		local SelectedResult = if SelectedFunction then SelectedFunction() else nil
		local Node = value1.node
		t[value1] = Node ~= nil and (SelectedResult ~= nil and (SelectedResult == Node or SelectedResult:IsDescendantOf(Node)))
	end
	table.sort(Copy, function(A, B)
		-- upvalues: t (copy), p1 (copy)
		return if A.priority == B.priority then if t[A] == t[B] then p1.order[B] < p1.order[A] else t[A] else B.priority < A.priority
	end)
	
	for _, value2 in Copy do
		local Gui = value2.gui
		local IsMenuIsOpen: boolean = Name == "Escape" and (Gui ~= nil and Gui.MenuIsOpen == true)
		local Inverted: boolean = FocusedTextBox ~= nil and not (value2.editing ~= nil and value2.editing(FocusedTextBox))
		
		if value2.keys[Name] and not IsMenuIsOpen and not Inverted and value2.enabled() then
			value2.press()
			
			if value2.sink then break end
		end
	end
end

return table.freeze({
	KEYS = Frozen,
	add = function(UserInputService, KeyCodes, Value)
		-- upvalues: self (copy), dispatch (copy)
		local SelfEntry = self[UserInputService]
		
		if SelfEntry == nil then
			local config = {
				count = 0,
				began = nil,
				handlers = {},
				order = {},
				ending = {},
				keyCodes = KeyCodes
			}
			SelfEntry = config
			self[UserInputService] = config
		end
		local SelfEntry1 = SelfEntry
		SelfEntry1.count += 1
		SelfEntry1.order[Value] = SelfEntry1.count
		table.insert(SelfEntry1.handlers, Value)
		
		if SelfEntry1.began == nil then
			SelfEntry1.began = UserInputService.InputBegan:Connect(function(Input)
				-- upvalues: dispatch (upval), UserInputService (copy), SelfEntry1 (copy)
				dispatch(UserInputService, SelfEntry1, Input)
			end)
		end
		return function()
			-- upvalues: SelfEntry1 (copy), Value (copy)
			local FoundIndex: number? = table.find(SelfEntry1.handlers, Value)
			
			if FoundIndex then
				table.remove(SelfEntry1.handlers, FoundIndex)
			end
			SelfEntry1.order[Value] = nil
			
			if #SelfEntry1.handlers == 0 then
				if SelfEntry1.began then
					SelfEntry1.began:Disconnect()
					SelfEntry1.began = nil
				end
				for _, Connection in SelfEntry1.ending do
					Connection:Disconnect()
				end
				table.clear(SelfEntry1.ending)
			end
		end
	end
})