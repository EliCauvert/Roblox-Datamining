local _ = require("./types")

return function(p1, Gui, Callback, Callback1)
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local Tbl = {}
	local t = {}
	setmetatable(t, { __mode = "k" })
	
	local function begin(Input)
		-- upvalues: TypesEnum (copy), Tbl (copy), Callback (copy)
		if Input.UserInputType ~= TypesEnum.UserInputType.Touch and Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 then return end
		if not Tbl[Input] then
			Tbl[Input] = true
			
			if next(Tbl) == nil then
				Callback()
			end
		end
	end
	
	local function finish(Input)
		-- upvalues: Tbl (copy), Callback1 (copy), TypesEnum (copy)
		if Tbl[Input] then
			Tbl[Input] = nil
			
			if next(Tbl) == nil then
				Callback1(Input.UserInputState == TypesEnum.UserInputState.Cancel)
			end
		end
	end
	
	local function listen(Gui)
		-- upvalues: t (copy), Runtime (copy), begin (copy)
		if Gui:IsA("GuiObject") and not t[Gui] then
			t[Gui] = true
			Runtime.connect(Gui, "InputBegan", begin)
		end
	end
	
	if Gui:IsA("GuiObject") and not t[Gui] then
		t[Gui] = true
		Runtime.connect(Gui, "InputBegan", begin)
	end
	for _, Gui1 in Gui:GetDescendants() do
		if Gui1:IsA("GuiObject") and not t[Gui1] then
			t[Gui1] = true
			Runtime.connect(Gui1, "InputBegan", begin)
		end
	end
	Runtime.connect(Gui, "DescendantAdded", p1.Compose.bindOwner(listen))
	Runtime.connect(Gui, "InputEnded", finish)
	local UserInputService = p1.config.userInputService
	
	if UserInputService then
		Runtime.connect(UserInputService, "InputEnded", finish)
		Runtime.connect(UserInputService, "WindowFocusReleased", function()
			-- upvalues: Tbl (copy), Callback1 (copy)
			if next(Tbl) ~= nil then
				table.clear(Tbl)
				Callback1(true)
			end
		end)
	end
end