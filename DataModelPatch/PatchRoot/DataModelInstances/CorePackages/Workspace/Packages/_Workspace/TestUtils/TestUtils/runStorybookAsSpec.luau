return function(p1, Callback: (any, any) -> (), Callback1)
	local StoryRoot = p1.storyRoot
	local Middleware = p1.middleware or function(...)
		return ...
	end
	local ScreenGui = Instance.new("ScreenGui")
	Callback("SHOULD run all stories with no issue", function()
		-- upvalues: StoryRoot (copy), Callback1 (copy), Middleware (copy), ScreenGui (copy)
		for _, ModuleScript in ipairs(StoryRoot:GetDescendants()) do
			if ModuleScript:IsA("ModuleScript") and ModuleScript.Name:find(".story$") then
				Callback1("SHOULD mount: " .. ModuleScript:GetFullName(), function()
					-- upvalues: ModuleScript (copy), Middleware (upval), ScreenGui (upval)
					Middleware(require(ModuleScript), ScreenGui)()
				end)
			end
		end
	end)
end