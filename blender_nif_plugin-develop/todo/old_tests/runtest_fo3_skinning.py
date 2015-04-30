"""Automated skinning tests for the blender nif scripts."""

# ***** BEGIN LICENSE BLOCK *****
# 
# BSD License
# 
# Copyright (c) 2005-2011, NIF File Format Library and Tools
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. The name of the NIF File Format Library and Tools project may not be
#    used to endorse or promote products derived from this software
#    without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# ***** END LICENSE BLOCK *****

from itertools import izip
import os.path

from nif_test import TestSuite
from pyffi.formats.nif import NifFormat
from pyffi.spells.nif.check import SpellCompareSkinData
from pyffi.spells.nif import NifToaster

class SkinningTestSuite(TestSuite):
    def run(self):
        # fo3 body path
        fo3_male = os.path.join(
            self.config.get("path", "fallout3"),
            "meshes", "characters", "_male")
        # get skeleton
        # the skeleton.nif won't work because the bones
        # are not in bind position!!!
        #self.test(
        #    filename = os.path.join(fo3_male, "skeleton.nif"),
        #    config = dict(IMPORT_SKELETON=1,
        #                  IMPORT_ANIMATION=False))
        # instead, create a full body nif and import that as skeleton
        self.make_fo3_fullbody()
        self.test(
            filename = 'test/nif/fo3/skeleton.nif',
            config = dict(IMPORT_SKELETON=1,
                          IMPORT_ANIMATION=False))
        # fallout 3 body
        self.test(
            filename = os.path.join(fo3_male, "femaleupperbody.nif"),
            config = dict(
                IMPORT_SKELETON=2,
                IMPORT_TEXTURE_PATH=[self.config.get("path", "fallout3")]),
            selection = ['Scene Root'])
        self.test(
            filename = 'test/nif/fo3/_femaleupperbody.nif',
            config = dict(
                game = 'FALLOUT_3', EXPORT_SMOOTHOBJECTSEAMS = True,
                EXPORT_FLATTENSKIN = True),
            selection = ['Scene Root'])
        # compare skindata
        toaster = NifToaster(spellclass=SpellCompareSkinData,
                             options=dict(arg="test/nif/fo3/_femaleupperbody.nif",
                                          verbose=99))
        toaster.toast(top=os.path.join(fo3_male, "femaleupperbody.nif"))

suite = SkinningTestSuite("skinning")
suite.run()

