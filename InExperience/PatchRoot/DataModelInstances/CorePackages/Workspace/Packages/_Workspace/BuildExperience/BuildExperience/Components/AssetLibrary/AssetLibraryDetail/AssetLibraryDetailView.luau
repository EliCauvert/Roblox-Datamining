local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local assetLibraryAudioPlayerContainerModule = require(script.Parent.Parent.AssetLibraryAudioPlayer.AssetLibraryAudioPlayerContainer)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local overflowMenuPageShellModule = require(buildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local _ = require(buildExperience.Components.ModelLibrary.collectWorkspaceModels)
local modelViewportModule = require(buildExperience.Components.ModelLibrary.ModelViewport)
local button = foundationModule.Button
local icon = foundationModule.Icon
local image = foundationModule.Image
local iconButton = foundationModule.IconButton
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius

local function getAttribution(p1)
	local t = {}
	
	if p1.creatorName ~= nil and p1.creatorName ~= "" then
		table.insert(t, p1.creatorName)
	end
	if p1.createTime ~= nil and p1.createTime ~= "" then
		table.insert(t, p1.createTime)
	end
	return if #t == 0 then nil else table.concat(t, " \194\183 ")
end

return function(value)
	-- upvalues: reactModule (ref), view (ref), modelViewportModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), button (ref), chatActionsModule (ref), image (ref), skeleton (ref), radius (ref), getAttribution (ref), assetLibraryAudioPlayerContainerModule (ref), icon (ref), foundationModule (ref), overflowMenuPageShellModule (ref)
	local asset = value.asset
	local liveModel = value.liveModel
	local var1 = reactModule.useRef(nil)
	local var2 = if asset ~= nil then "" else asset.displayName
	local var3 = nil
	
	if value.status == "Ready" and liveModel ~= nil then
		return reactModule.createElement(view, {
			tag = "col size-full clip bg-surface-100",
			testId = "AssetLibrary.Preview"
		}, {
			Media = reactModule.createElement(view, {
				LayoutOrder = 2,
				ClipsDescendants = true,
				ZIndex = 1,
				testId = "AssetLibrary.Preview.ModelRegion",
				Size = UDim2.fromScale(1, 0),
				flexItem = { FlexMode = Enum.UIFlexMode.Fill }
			}, {
				Viewport = reactModule.createElement(modelViewportModule, {
					backgroundTransparency = 1,
					cameraDistanceScale = 1.25,
					isInteractive = false,
					testId = "AssetLibrary.Preview.Model",
					model = liveModel.model,
					size = UDim2.fromScale(1, 1),
					controllerRef = var1
				})
			}),
			Header = reactModule.createElement(view, {
				LayoutOrder = 1,
				ZIndex = 2,
				testId = "AssetLibrary.Preview-header",
				tag = {
					["composition-content-header"] = true,
					["row align-y-center gap-small size-full-0 auto-y padding-y-small bg-surface-100"] = true
				}
			}, {
				Back = reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "AssetLibrary.Preview-close",
					icon = iconName.ChevronLargeLeft,
					onActivated = value.onBack,
					size = inputSize.Medium,
					variant = buttonVariant.Utility
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "fill text-heading-medium text-align-x-left text-truncate-end content-emphasis",
					testId = "AssetLibrary.Preview-title",
					Text = liveModel.name
				})
			}),
			Actions = reactModule.createElement(view, {
				LayoutOrder = 3,
				ZIndex = 3,
				tag = "col gap-small size-full-0 auto-y padding-x-medium padding-bottom-medium bg-surface-100",
				testId = "AssetLibrary.Preview.Actions"
			}, {
				Controls = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "row align-x-right align-y-center gap-small size-full-0 auto-y",
					testId = "AssetLibrary.Preview.Controls"
				}, {
					RotateLeft = reactModule.createElement(iconButton, {
						LayoutOrder = 1,
						isCircular = true,
						testId = "AssetLibrary.Preview.RotateLeft",
						icon = iconName.ArrowRotateLeft,
						onActivated = function()
							-- upvalues: var1 (ref)
							if var1.current ~= nil then
								var1.current.rotateLeft()
							end
						end,
						size = inputSize.Medium,
						variant = buttonVariant.Utility
					}),
					RotateRight = reactModule.createElement(iconButton, {
						LayoutOrder = 2,
						isCircular = true,
						testId = "AssetLibrary.Preview.RotateRight",
						icon = iconName.ArrowRotateRight,
						onActivated = function()
							-- upvalues: var1 (ref)
							if var1.current ~= nil then
								var1.current.rotateRight()
							end
						end,
						size = inputSize.Medium,
						variant = buttonVariant.Utility
					}),
					ViewInWorld = reactModule.createElement(button, {
						LayoutOrder = 3,
						ZIndex = 4,
						text = "View in World",
						testId = "AssetLibrary.Preview.SeeInWorld",
						width = UDim.new(0, 115),
						onActivated = function()
							-- upvalues: liveModel (ref), value (ref)
							if liveModel ~= nil and value.onSeeInWorld ~= nil then
								value.onSeeInWorld(liveModel)
							end
						end,
						variant = buttonVariant.Emphasis,
						size = inputSize.Small
					})
				}),
				Composer = if value.chatActions ~= nil then nil else reactModule.createElement(view, {
					LayoutOrder = 2,
					ZIndex = 4,
					tag = "size-full-0 auto-y padding-top-xxsmall",
					testId = "AssetLibrary.Preview.Composer"
				}, {
					Actions = reactModule.createElement(chatActionsModule, value.chatActions)
				})
			})
		})
	elseif value.status == "Ready" and asset ~= nil and asset.assetType ~= "Audio" then
		local createElement_1
		local thumbnail = asset.thumbnail or (if asset.assetId ~= nil then "rbxasset://textures/ui/GuiImagePlaceholder.png" else `rbxthumb://type=Asset&id={asset.assetId}&w=420&h=420`)
		local createElement = reactModule.createElement
		local var4 = view
		local t = {
			tag = "size-full clip",
			testId = "AssetLibrary.Preview.ImageRenderer"
		}
		local t_1 = {
			Media = reactModule.createElement(image, {
				testId = "AssetLibrary.Preview.Media",
				Image = thumbnail,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromScale(1, 1)
			})
		}
		
		if (asset.description == nil or asset.description == "") and asset.updateTime == nil then
			createElement_1 = nil
		else
			createElement_1 = reactModule.createElement
			createElement_1 = createElement_1(view, {
				ZIndex = 2,
				tag = "col gap-small anchor-bottom-left auto-y",
				testId = "AssetLibrary.Preview.SupportingContent",
				Position = UDim2.new(0, 20, 1, -20),
				Size = UDim2.new(1, -40, 0, 0)
			}, {
				Description = if asset.description == nil or asset.description == "" then nil else reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = asset.description
				}),
				Updated = if asset.updateTime ~= nil then nil else reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-caption-small text-align-x-left content-muted",
					testId = "AssetLibrary.Preview.Updated",
					Text = `{value.strings.updated} {asset.updateTime}`
				})
			})
		end
		t_1.SupportingContent = createElement_1
		var3 = createElement(var4, t, t_1)
	end
	if var3 == nil then
		if value.status == "Loading" or value.status == "NotReady" then
			var3 = reactModule.createElement(view, {
				tag = "col align-x-center gap-large size-full-0 auto-y padding-y-xlarge",
				testId = "AssetLibrary.Preview.Skeleton"
			}, {
				Preview = reactModule.createElement(view, {
					LayoutOrder = 1,
					testId = "AssetLibrary.Preview.Container",
					Size = UDim2.fromScale(1, 1),
					aspectRatio = {
						AspectRatio = 1,
						AspectType = Enum.AspectType.FitWithinMaxSize,
						DominantAxis = Enum.DominantAxis.Width
					},
					sizeConstraint = { MaxSize = Vector2.new(320, 320) }
				}, {
					Skeleton = reactModule.createElement(skeleton, { radius = radius.Medium, Size = UDim2.fromScale(1, 1) })
				}),
				Info = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "col align-x-center gap-small size-full-0 auto-y"
				}, {
					Title = reactModule.createElement(skeleton, {
						LayoutOrder = 1,
						Size = UDim2.new(0.6, 0, 0, 20),
						radius = radius.Small
					}),
					Subtitle = reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(0.4, 0, 0, 20),
						radius = radius.Small
					})
				})
			})
		elseif value.status == "Failed" or asset == nil then
			var3 = reactModule.createElement(text, {
				tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-default",
				Text = value.strings.assetUnavailable
			})
		else
			local var5 = getAttribution(asset)
			
			if asset.assetType == "Audio" then
				local createElement_2
				local createElement = reactModule.createElement
				local var6 = view
				local t = { tag = "col size-full" }
				local t_1 = {
					PlayerRegion = reactModule.createElement(view, {
						LayoutOrder = 1,
						tag = "col align-x-center align-y-center fill size-full-0 padding-bottom-xlarge"
					}, {
						Player = if asset.contentId == nil or asset.contentId == "" then reactModule.createElement(icon, {
							tag = "auto-xy content-default",
							name = iconName.MusicNote,
							size = foundationModule.Enums.IconSize.Large
						}) else reactModule.createElement(assetLibraryAudioPlayerContainerModule, {
							thumbnail = nil,
							contentId = asset.contentId,
							title = asset.displayName,
							artist = asset.creatorName or asset.displayType
						})
					})
				}
				
				if asset.description == nil and var5 == nil then
					createElement_2 = nil
				else
					createElement_2 = reactModule.createElement
					createElement_2 = createElement_2(view, {
						LayoutOrder = 2,
						tag = "col gap-medium size-full-0 auto-y padding-bottom-medium",
						testId = "AssetLibrary.Preview.SupportingContent"
					}, {
						Description = if asset.description == nil or asset.description == "" then nil else reactModule.createElement(text, {
							LayoutOrder = 1,
							tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
							Text = asset.description
						}),
						Attribution = if var5 ~= nil then nil else reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-muted",
							Text = var5
						})
					})
				end
				t_1.SupportingContent = createElement_2
				var3 = createElement(var6, t, t_1)
			else
				error("Non-audio ready assets render through the immersive preview")
			end
		end
	end
	return if value.chatActions == nil then if value.presentation == "Sheet" then reactModule.createElement(view, { tag = "col size-full", testId = "AssetLibrary.Preview" }, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["composition-content-header"] = true,
				["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
			}
		}, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				testId = "AssetLibrary.Preview-close",
				icon = iconName.ChevronLargeLeft,
				onActivated = value.onBack,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-small text-align-x-left content-emphasis",
				Text = var2
			})
		}),
		Content = reactModule.createElement(view, { LayoutOrder = 2, tag = "fill size-full-0" }, { Body = var3 })
	}) else reactModule.createElement(overflowMenuPageShellModule, {
		testId = "AssetLibrary.Preview",
		title = var2,
		closeIcon = iconName.ChevronLargeLeft,
		onClose = value.onBack,
		disableScrolling = value.status == "Ready",
		content = var3
	}) else reactModule.createElement(view, {
		tag = "col size-full bg-surface-100",
		testId = "AssetLibrary.Preview"
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			testId = "AssetLibrary.Preview-header",
			tag = {
				["composition-content-header"] = true,
				["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
			}
		}, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				testId = "AssetLibrary.Preview-close",
				icon = iconName.ChevronLargeLeft,
				onActivated = value.onBack,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				testId = "AssetLibrary.Preview-title",
				Text = var2
			})
		}),
		Renderer = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "fill size-full-0",
			testId = "AssetLibrary.Preview.Renderer"
		}, { Content = var3 }),
		Composer = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "col size-full-0 auto-y padding-x-medium padding-bottom-medium bg-surface-100",
			testId = "AssetLibrary.Preview.Composer"
		}, {
			Actions = reactModule.createElement(chatActionsModule, value.chatActions)
		})
	})
end