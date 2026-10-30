local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local ScrollbarOverlayModule = require(ViewRecyclerRoblox.RobloxAdapter.ScrollbarOverlay)

local function _(Name, Parent)
	local Frame = Instance.new("Frame")
	Frame.Name = Name
	Frame.Active = false
	Frame.BackgroundTransparency = 1
	Frame.BorderSizePixel = 0
	Frame.Selectable = false
	Frame.Parent = Parent
	
	return Frame
end

return {
	new = function(Frame: Frame, p1)
		-- upvalues: ScrollbarOverlayModule (copy)
		local ViewRecyclerOverlayContainer = Instance.new("Folder")
		ViewRecyclerOverlayContainer.Name = "ViewRecyclerOverlayContainer"
		local ViewRecyclerOverlayBounds = Instance.new("Frame")
		ViewRecyclerOverlayBounds.Name = "ViewRecyclerOverlayBounds"
		ViewRecyclerOverlayBounds.Active = false
		ViewRecyclerOverlayBounds.BackgroundTransparency = 1
		ViewRecyclerOverlayBounds.BorderSizePixel = 0
		ViewRecyclerOverlayBounds.Selectable = false
		ViewRecyclerOverlayBounds.Parent = ViewRecyclerOverlayContainer
		ViewRecyclerOverlayBounds.Size = UDim2.fromScale(1, 1)
		local ViewRecyclerOverlayWindow = Instance.new("Frame")
		ViewRecyclerOverlayWindow.Name = "ViewRecyclerOverlayWindow"
		ViewRecyclerOverlayWindow.Active = false
		ViewRecyclerOverlayWindow.BackgroundTransparency = 1
		ViewRecyclerOverlayWindow.BorderSizePixel = 0
		ViewRecyclerOverlayWindow.Selectable = false
		ViewRecyclerOverlayWindow.Parent = ViewRecyclerOverlayBounds
		local ViewRecyclerOverlay = Instance.new("Frame")
		ViewRecyclerOverlay.Name = "ViewRecyclerOverlay"
		ViewRecyclerOverlay.Active = false
		ViewRecyclerOverlay.BackgroundTransparency = 1
		ViewRecyclerOverlay.BorderSizePixel = 0
		ViewRecyclerOverlay.Selectable = false
		ViewRecyclerOverlay.Parent = ViewRecyclerOverlayWindow
		ViewRecyclerOverlay.ClipsDescendants = true
		local ConnectResult = ScrollbarOverlayModule.connect(Frame, ViewRecyclerOverlay, p1)
		local Flag = false
		
		local function synchronize()
			-- upvalues: Flag (ref), ViewRecyclerOverlayContainer (copy), ViewRecyclerOverlayWindow (copy), Frame (copy), ViewRecyclerOverlayBounds (copy)
			if Flag or ViewRecyclerOverlayContainer.Parent == nil then return end
			ViewRecyclerOverlayWindow.Visible = Frame.Visible
			ViewRecyclerOverlayWindow.ZIndex = Frame.ZIndex + 1
			ViewRecyclerOverlayBounds.ZIndex = ViewRecyclerOverlayWindow.ZIndex
			local AbsoluteSize = ViewRecyclerOverlayBounds.AbsoluteSize
			
			if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then return end
			local AbsoluteSize1 = Frame.AbsoluteSize
			local AbsolutePositionDelta = Frame.AbsolutePosition - ViewRecyclerOverlayBounds.AbsolutePosition
			ViewRecyclerOverlayWindow.Size = UDim2.fromScale(AbsoluteSize1.X / AbsoluteSize.X, AbsoluteSize1.Y / AbsoluteSize.Y)
			local AbsolutePositionDelta1 = Frame.AbsolutePosition - ViewRecyclerOverlayWindow.AbsolutePosition
			
			if math.abs(AbsolutePositionDelta1.X) >= 0.5 or math.abs(AbsolutePositionDelta1.Y) >= 0.5 then
				ViewRecyclerOverlayWindow.Position = UDim2.fromScale(AbsolutePositionDelta.X / AbsoluteSize.X, AbsolutePositionDelta.Y / AbsoluteSize.Y)
			end
		end
		
		local Connections = {
			Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(synchronize),
			Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(synchronize),
			Frame:GetPropertyChangedSignal("Visible"):Connect(synchronize),
			Frame:GetPropertyChangedSignal("ZIndex"):Connect(synchronize),
			Frame:GetPropertyChangedSignal("Parent"):Connect(function()
				-- upvalues: Flag (ref), ViewRecyclerOverlayContainer (copy), Frame (copy), synchronize (copy)
				if not Flag then
					ViewRecyclerOverlayContainer.Parent = Frame.Parent
					synchronize()
					
					return
				end
			end),
			ViewRecyclerOverlayWindow:GetPropertyChangedSignal("AbsolutePosition"):Connect(synchronize),
			ViewRecyclerOverlayBounds:GetPropertyChangedSignal("AbsoluteSize"):Connect(synchronize)
		}
		
		if not Flag then
			ViewRecyclerOverlayContainer.Parent = Frame.Parent
			synchronize()
		end
		return table.freeze({
			overlay = ViewRecyclerOverlay,
			destroy = function()
				-- upvalues: Flag (ref), Connections (copy), ConnectResult (copy), ViewRecyclerOverlayContainer (copy)
				if Flag then return end
				Flag = true
				
				for _, connection in Connections do
					connection:Disconnect()
				end
				ConnectResult()
				ViewRecyclerOverlayContainer:Destroy()
			end
		})
	end
}