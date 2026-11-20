local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local FoundationModule = require(Parent.Foundation)
local ModelViewportModule = require(Parent.ModelViewport)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local Loading = FoundationModule.Loading

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), ModelViewportModule (copy), Loading (copy)
	return ReactModule.createElement(View, {
		tag = "size-full",
		testId = "avatar-workshop-avatar-preview-view",
		LayoutOrder = Frame.LayoutOrder
	}, {
		SceneContainer = ReactModule.createElement(View, {
			tag = "size-full",
			testId = "avatar-workshop-avatar-preview-scene",
			Visible = not Frame.isLoading
		}, {
			Scene = ReactModule.createElement(ModelViewportModule.ModelViewportView, {
				sceneRefs = Frame.sceneRefs,
				inputHandlers = Frame.inputHandlers
			})
		}),
		LoadingContainer = if Frame.isLoading then ReactModule.createElement(View, { tag = "row align-x-center align-y-center size-full" }, { Loading = ReactModule.createElement(Loading) }) else nil
	})
end