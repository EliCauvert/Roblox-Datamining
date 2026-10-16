return function(p1, Callback: (any, any) -> (), Callback1) --[[ Line: 1 ]]
	local StoryRoots = p1.storyRoots
	local MapStoryFunction = p1.mapStory
	Callback("SHOULD run all stories with no issue", function() --[[ Line: 5 ]]
		-- upvalues: StoryRoots (copy), Callback1 (copy), MapStoryFunction (copy)
		for _, storyRoot in ipairs(StoryRoots) do
			for _, ModuleScript in ipairs(storyRoot:GetDescendants()) do
				if ModuleScript:IsA("ModuleScript") and ModuleScript.Name:find(".story$") then
					Callback1("SHOULD mount: " .. ModuleScript:GetFullName(), function(p2) --[[ Line: 10 ]]
						-- upvalues: ModuleScript (copy), MapStoryFunction (upval)
						local Module = require(ModuleScript)
						local _, MountFrameResult2 = p2.UnitTestHelpers.mountFrame((MapStoryFunction(function() --[[ Line: 12 ]]
							-- upvalues: Module (copy)
							return Module
						end)()))
						MountFrameResult2()
					end)
				end
			end
		end
	end)
end