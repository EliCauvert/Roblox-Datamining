local AvatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local Parent = AvatarExperienceNavigation.Parent
local AvatarScreenModule = require(AvatarExperienceNavigation.Enums.AvatarScreen)
local UnifiedLoggingSurfaceModule = require(AvatarExperienceNavigation.Enums.UnifiedLoggingSurface)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.Dash)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlagsModule.FFlagAXEditorSubcategoryFilters
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local FFlagAXAvatarFoldersEnabled = AvatarExperienceFlagsModule.FFlagAXAvatarFoldersEnabled
local FFlagAXPhotoboothMomentsPage = AvatarExperienceFlagsModule.FFlagAXPhotoboothMomentsPage
local FFlagAXPhotoboothMomentsLogging = AvatarExperienceFlagsModule.FFlagAXPhotoboothMomentsLogging
local FFlagAXFixAvatarScreenVR = AvatarExperienceFlagsModule.FFlagAXFixAvatarScreenVR
local FFlagAXGifting = AvatarExperienceFlagsModule.FFlagAXGifting
local FFlagAXMakeupReleaseFTUX = AvatarExperienceFlagsModule.FFlagAXMakeupReleaseFTUX
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagEditProfileImageV2Enabled = require(Parent.SharedFlags).FFlagEditProfileImageV2Enabled
local config = {
	isTransparent = false,
	coversSceneWhenExpanded = false,
	isTryOnOutfitResetPage = false,
	isRefinementPage = false,
	refinementButtonVisible = false,
	VRPanelRoundedCorners = false,
	VRPanelPlacement = "Center"
}
local config1 = {
	[AvatarScreenModule.AccessoryAdjustment] = {
		isRefinementPage = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[AvatarScreenModule.AvatarExperienceLandingPage] = { isTryOnOutfitResetPage = true },
	[AvatarScreenModule.AvatarExperienceRoot] = {},
	[AvatarScreenModule.AvatarBackground] = { isTransparent = false },
	[AvatarScreenModule.BackgroundGeneration] = {
		analyticsData = if AvatarExperienceFlagsModule.FFlagAXBackgroundGenerationAnalytics then {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.BACKGROUND_GENERATION
		} else nil
	},
	[AvatarScreenModule.Catalog] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CATALOG
		}
	},
	[AvatarScreenModule.CatalogContextMenu] = { VRPanelPlacement = "Right" },
	[AvatarScreenModule.CatalogSearch] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.SEARCH_RESULTS
		}
	},
	[AvatarScreenModule.CatalogSearchLanding] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.SEARCH_LANDING_PAGE
		}
	},
	[AvatarScreenModule.ItemDetails] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[AvatarScreenModule.OutfitDetails] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[AvatarScreenModule.ItemOwnershipPage] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[AvatarScreenModule.CreateOrUpdateOutfitMenu] = { VRPanelPlacement = "Left" },
	[AvatarScreenModule.LayeredClothingSort] = {
		isRefinementPage = true,
		VRPanelPlacement = "Center",
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[AvatarScreenModule.LCSortContextMenu] = { VRPanelPlacement = "Right" },
	[AvatarScreenModule.AvatarEditor] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		isTryOnOutfitResetPage = not game:DefineFastFlag("AXKeepTryOnsInAvatarEditor", false),
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[AvatarScreenModule.AvatarRefinement] = {
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[AvatarScreenModule.ManageOutfitPage] = {
		isTransparent = not AvatarExperienceFlagsModule.FFlagAXFixGamepadNavigationOnOutfitManagement,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[AvatarScreenModule.ProfilePictureEditorEmotes] = { isTryOnOutfitResetPage = true },
	[AvatarScreenModule.ResellersPage] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[AvatarScreenModule.SellItemPage] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[AvatarScreenModule.SellItemPeekView] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[AvatarScreenModule.SortAndFilters] = { isTransparent = true, VRPanelPlacement = "Left" },
	[AvatarScreenModule.TryOnItem] = {
		isTransparent = false,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[AvatarScreenModule.UpdateOutfitPage] = {
		isTransparent = true,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true
	},
	[AvatarScreenModule.AdjustAccessoryView] = {
		isTransparent = false,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[AvatarScreenModule.HeadRefinement] = {
		isRefinementPage = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[AvatarScreenModule.LookDetails] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[AvatarScreenModule.ContextMenu] = { VRPanelPlacement = "Right" },
	[AvatarScreenModule.MySharedAvatars] = {
		isTryOnOutfitResetPage = true,
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[AvatarScreenModule.FavoritesSaved] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true
	},
	[AvatarScreenModule.CommunityAvatarEntryMenu] = { VRPanelPlacement = "Left" },
	[AvatarScreenModule.SearchLandingFocusedWidgetPage] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.SEARCH_LANDING_PAGE
		}
	},
	[AvatarScreenModule.BodyShape] = {
		isRefinementPage = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[AvatarScreenModule.AvatarSwitcher] = {
		isTransparent = false,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[AvatarScreenModule.EditEmotes] = {
		isTransparent = false,
		isTryOnOutfitResetPage = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
}

if AvatarExperienceFlagsModule.FFlagAXOutfitPageRevamp then
	config1[AvatarScreenModule.AddOutfitDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	config1[AvatarScreenModule.DuplicateOutfitDialog] = { isTransparent = false, VRPanelPlacement = "Left" }
	config1[AvatarScreenModule.DuplicateOutfitNameDialog] = { isTransparent = false, VRPanelPlacement = "Left" }
	config1[AvatarScreenModule.RenameOutfitDialog] = { isTransparent = false, VRPanelPlacement = "Right" }
	config1[AvatarScreenModule.DeleteOutfitDialog] = { isTransparent = false, VRPanelPlacement = "Right" }
	config1[AvatarScreenModule.BulkDeleteOutfitDialog] = { isTransparent = false, VRPanelPlacement = "Left" }
	config1[AvatarScreenModule.ManageOutfitsPage] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
end
if FFlagAXAvatarFoldersEnabled then
	config1[AvatarScreenModule.CreateFolderDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	config1[AvatarScreenModule.RenameFolderDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	config1[AvatarScreenModule.DuplicateFolderNameDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	config1[AvatarScreenModule.FolderNameNotAllowedDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	config1[AvatarScreenModule.FolderLimitReachedDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	config1[AvatarScreenModule.FolderErrorDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	config1[AvatarScreenModule.DeleteFolderPrompt] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	config1[AvatarScreenModule.SelectFolderMenu] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	config1[AvatarScreenModule.RemoveFromFolderDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	config1[AvatarScreenModule.FolderItemsErrorDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
end
if FFlagAXFixAvatarScreenVR then
	if FFlagAXCatalogMakeupSupport then
		config1[AvatarScreenModule.MakeupMax6LayersPrompt] = {
			isTransparent = false,
			VRPanelPlacement = "Left",
			VRPanelRoundedCorners = true
		}
	end
	if FFlagAXMakeupReleaseFTUX then
		config1[AvatarScreenModule.MakeupReleaseFtuxPrompt] = {
			isTransparent = false,
			VRPanelPlacement = "Left",
			VRPanelRoundedCorners = true
		}
	end
end
if FFlagAXEditorSubcategoryFilters then
	config1[AvatarScreenModule.SubcategoryFiltersDropdown] = { isTransparent = true, VRPanelPlacement = "Left" }
end
config1[AvatarScreenModule.Checkout] = {
	isTransparent = true,
	coversSceneWhenExpanded = true,
	VRPanelPlacement = "Right",
	VRPanelRoundedCorners = true,
	analyticsData = {
		unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CATALOG
	}
}

if FFlagAXEnableProfileTab then
	config1[AvatarScreenModule.Profile] = {
		refinementButtonVisible = true,
		isTryOnOutfitResetPage = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true
	}
end
if FFlagAXEnableExpiredUserLookCheckout then
	config1[AvatarScreenModule.ExpiredUserLookActionBar] = {
		isTransparent = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true
	}
	config1[AvatarScreenModule.ExpiredUserLookCheckout] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
end
if FFlagAXGifting then
	config1[AvatarScreenModule.SendGiftRecipientPicker] = { isTransparent = true, VRPanelPlacement = "Left" }
	config1[AvatarScreenModule.SendGiftReview] = { isTransparent = true, VRPanelPlacement = "Left" }
end
if FFlagEditProfileImageV2Enabled then
	config1[AvatarScreenModule.EditProfileImage] = { isTryOnOutfitResetPage = true }
	config1[AvatarScreenModule.AppCatalogContextMenuHost] = { isTransparent = true }
end
if FFlagAXPhotoboothMomentsPage then
	config1[AvatarScreenModule.PhotoboothMomentsPage] = {
		isTryOnOutfitResetPage = true,
		analyticsData = if FFlagAXPhotoboothMomentsLogging then {
			unifiedLoggingSurface = UnifiedLoggingSurfaceModule.PHOTOBOOTH_MOMENTS
		} else nil
	}
end
local AvatarScreenPropertiesModule = {}

for _, value in AvatarScreenModule do
	AvatarScreenPropertiesModule[value] = CryoModule.Dictionary.join(config, config1[value] or {})
end
return AvatarScreenPropertiesModule