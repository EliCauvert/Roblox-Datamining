local Parent = script:FindFirstAncestor("SceneManagement").Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local Context = ReactModule.createContext(nil)

return function(p1)
	-- upvalues: ReactModule (copy), Context (copy), ReactRobloxModule (copy), Workspace (copy), CoreGui (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseContextResult = ReactModule.useContext(Context)
	local NoUseContextResult = UseContextResult == nil
	
	return ReactModule.createElement(Context.Provider, { value = UseRefResult2 }, {
		AdorneePortal = ReactRobloxModule.createPortal({
			Adornee = ReactModule.createElement("Part", {
				Transparency = 1,
				CanCollide = false,
				CanTouch = false,
				Name = `{p1.name}_Part`,
				ref = UseRefResult,
				Size = p1.adorneeSize,
				CFrame = if NoUseContextResult then p1.adorneeCFrame else nil,
				Anchored = NoUseContextResult
			}, {
				ParentAttachment = if NoUseContextResult then nil else ReactModule.createElement(ReactModule.Fragment, nil, {
					SelfAttachment = ReactModule.createElement("Attachment", {
						Name = `{p1.name}_SelfAttachment`,
						CFrame = p1.adorneeCFrame,
						ref = UseRefResult1
					}),
					ParentConstraint = ReactModule.createElement("RigidConstraint", {
						Enabled = true,
						Name = `{p1.name}_ParentConstraint`,
						Attachment0 = UseContextResult,
						Attachment1 = UseRefResult1
					})
				}),
				ChildrenAttachment = ReactModule.createElement("Attachment", {
					Name = `{p1.name}_ChildrenAttachment`,
					CFrame = CFrame.identity,
					ref = UseRefResult2
				})
			})
		}, p1.adorneeParent or Workspace),
		SurfaceGuiPortal = ReactRobloxModule.createPortal({
			SurfaceGui = ReactModule.createElement("SurfaceGui", {
				Active = true,
				AlwaysOnTop = true,
				LightInfluence = 0,
				Name = `{p1.name}_SurfaceGui`,
				Adornee = UseRefResult,
				Enabled = p1.isVisible,
				CanvasSize = p1.canvasSize,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, p1.children)
		}, p1.surfaceGuiParent or CoreGui)
	})
end