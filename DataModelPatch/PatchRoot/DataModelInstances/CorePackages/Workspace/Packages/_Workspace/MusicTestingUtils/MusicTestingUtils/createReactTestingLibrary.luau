local MusicTestingUtils = script:FindFirstAncestor("MusicTestingUtils")
local _ = require(MusicTestingUtils.Parent.React)
local CryoModule = require(MusicTestingUtils.Parent.Cryo)
local ContextProvidersModule = require(MusicTestingUtils.ContextProviders)

return function()
	-- upvalues: MusicTestingUtils (copy), CryoModule (copy), ContextProvidersModule (copy)
	local ReactTestingLibraryModule = require(MusicTestingUtils.Parent.ReactTestingLibrary)
	local FoundationTestingLibraryModule = require(MusicTestingUtils.Parent.FoundationTestingLibrary)
	local RenderFunction = ReactTestingLibraryModule.render
	
	return {
		render = function(p1, p2)
			-- upvalues: RenderFunction (copy), CryoModule (upval), ContextProvidersModule (upval), ReactTestingLibraryModule (copy), FoundationTestingLibraryModule (copy)
			return RenderFunction(p1, CryoModule.Dictionary.join({
				wrapper = ContextProvidersModule,
				queries = CryoModule.Dictionary.join(ReactTestingLibraryModule.queries, FoundationTestingLibraryModule.Queries)
			}, p2 or {}))
		end,
		act = ReactTestingLibraryModule.act,
		container = ReactTestingLibraryModule.container,
		document = ReactTestingLibraryModule.document,
		fireEvent = ReactTestingLibraryModule.fireEvent,
		screen = ReactTestingLibraryModule.screen,
		waitFor = ReactTestingLibraryModule.waitFor
	}
end