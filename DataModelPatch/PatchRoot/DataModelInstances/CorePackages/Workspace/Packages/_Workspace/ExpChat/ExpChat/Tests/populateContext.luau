local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent

return function(p1)
	-- upvalues: Parent (copy), ExpChat (copy)
	p1.Roact = require(Parent.Roact)
	p1.Rodux = require(Parent.Rodux)
	p1.RoactRodux = require(Parent.RoactRodux)
	p1.Rhodium = require(Parent.Dev.Rhodium)
	p1.storyMiddleware = require(ExpChat:FindFirstChild("ExpChat.storybook"):FindFirstChild("storyMiddleware"))
	p1.findFirstInstance = require(script.Parent.findFirstInstance)
	
	function p1.makeTree(p2, p3, Callback)
		return p2.Roact.createElement(p2.storyMiddleware(p3), Callback(p2))
	end
	
	function p1.createMount(p2, p3)
		return function(p4)
			-- upvalues: p2 (copy), p3 (copy)
			local Roact = p4.Roact
			local ScreenGui = Instance.new("ScreenGui")
			ScreenGui.Parent = game:GetService("CoreGui")
			local MountResult = Roact.mount(p4:makeTree(p2, p3), ScreenGui)
			
			return {
				roactInstance = MountResult,
				instance = ScreenGui,
				unmount = function()
					-- upvalues: Roact (copy), MountResult (copy), ScreenGui (copy)
					Roact.unmount(MountResult)
					ScreenGui:Destroy()
				end
			}
		end
	end
end