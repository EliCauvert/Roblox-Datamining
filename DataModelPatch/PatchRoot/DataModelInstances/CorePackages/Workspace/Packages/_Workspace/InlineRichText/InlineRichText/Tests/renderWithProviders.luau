local InlineRichText = script:FindFirstAncestor("InlineRichText")
local Parent = InlineRichText.Parent
local ReactModule = require(Parent.React)
local ReactTestingLibraryModule = require(Parent.Dev.ReactTestingLibrary)
local MockProvidersModule = require(InlineRichText.MockProviders)

return function(p1, p2)
	-- upvalues: ReactModule (copy), MockProvidersModule (copy), ReactTestingLibraryModule (copy)
	local Element = ReactModule.createElement(MockProvidersModule, { themeName = "Light" }, { component = ReactModule.createElement(p1, p2) })
	local RenderResult = nil
	ReactTestingLibraryModule.act(function()
		-- upvalues: RenderResult (ref), ReactTestingLibraryModule (upval), Element (copy)
		RenderResult = ReactTestingLibraryModule.render(Element)
	end)
	
	return RenderResult, function()
		-- upvalues: ReactTestingLibraryModule (upval)
		ReactTestingLibraryModule.cleanup()
	end
end