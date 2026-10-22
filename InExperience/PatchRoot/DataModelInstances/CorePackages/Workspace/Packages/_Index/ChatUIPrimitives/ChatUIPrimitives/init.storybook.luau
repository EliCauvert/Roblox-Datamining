local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet

local function StyleLinkPortal(p1)
	-- upvalues: UseStyleSheetFunction (copy), ReactRobloxModule (copy), ReactModule (copy)
	return ReactRobloxModule.createPortal(ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetFunction() }), p1.overlay)
end

return {
	name = ChatUIPrimitives.Name,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	storyRoots = { ChatUIPrimitives },
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy), StyleLinkPortal (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), p1 (copy), StyleLinkPortal (upval)
			local UseRefResult = ReactModule.useRef(Instance.new("Frame"))
			local Focus = p2 and p2.focus
			
			if Focus ~= nil and UseRefResult.current.Parent ~= Focus then
				UseRefResult.current.Parent = Focus
			end
			ReactModule.useLayoutEffect(function()
				-- upvalues: UseRefResult (copy)
				UseRefResult.current.Size = UDim2.fromScale(1, 1)
				UseRefResult.current.BackgroundTransparency = 1
			end, {})
			
			return ReactModule.createElement(FoundationProvider, {
				colorMode = p2 and p2.theme,
				device = p2 and p2.platform,
				overlayGui = if Focus == nil then nil else UseRefResult.current
			}, {
				Child = ReactModule.createElement(p1, p2),
				StyleLink = if Focus == nil then nil else ReactModule.createElement(StyleLinkPortal, { overlay = UseRefResult.current })
			})
		end
	end
}