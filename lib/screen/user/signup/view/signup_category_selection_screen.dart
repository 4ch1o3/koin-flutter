import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/koin/view/koin_screen.dart';
import 'package:koin/screen/user/signup/view/gradient_container.dart';
import 'package:koin/screen/user/signup/widget/selection_section.dart';
import 'package:koin/screen/user/signup/view/signup_personal_details_screen.dart';

class CategorySelectionScreen extends StatefulWidget {
  final String selectedNationality;
  final String selectedLanguage;
  final String selectedResidenceType;
  final String selectedResidencePeriod;

  const CategorySelectionScreen({
    super.key,
    required this.selectedNationality,
    required this.selectedLanguage,
    required this.selectedResidenceType,
    required this.selectedResidencePeriod,
  });

  @override
  State<CategorySelectionScreen> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  final Set<String> _selectedCategories = <String>{};
  final Set<String> _selectedRegions = <String>{};
  final Set<String> _selectedCultures = <String>{};

  final List<String> _categories = ['생활정보', '관광', '법', '일자리', '결혼'];
  final List<String> _regions = [
    '서울',
    '부산',
    '대전',
    '광주',
    '대구',
    '경기도',
    '강원도',
    '충청북도',
    '충청남도',
    '전라북도',
    '전라남도',
    '경상북도',
    '경상남도',
    '제주도',
    '울산',
  ];
  final List<String> _cultures = [
    '카페',
    '한식',
    '한옥',
    '전통',
    '공예',
    'Game',
    '한국어',
    'K-pop',
    'Music',
    'Movie',
    'Drama',
    'Sport',
    'Museum',
    '대학생',
    'Band',
    'Photo',
    'Book',
  ];

  void _goToNextStep() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => KoinScreen(
              // selectedNationality: widget.selectedNationality,
              // selectedLanguage: widget.selectedLanguage,
              // selectedResidenceType: widget.selectedResidenceType,
              // selectedResidencePeriod: widget.selectedResidencePeriod,
              // selectedCategories: _selectedCategories,
              // selectedRegions: _selectedRegions,
              // selectedCultures: _selectedCultures,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      title: TextSpan(
        style: Theme.of(context).textTheme.headlineLarge,
        children: <TextSpan>[
          TextSpan(text: '내가 관심 있는 '),
          TextSpan(text: '한국 관련 키워드', style: TextStyle(color: PRIMARY_COLOR)),
          TextSpan(text: '를\n자유롭게 선택해주세요.\n'),
        ],
      ),
      hasSubmitButton: true,
      submitCallback: () => _goToNextStep(),
      isSubmitEnabled: true,
      submitLabel: "Let's start Koin!",

      hasBottomTextButton: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          spacing: 36,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(),
            SelectionSection(
              title: '카테고리',
              options: _categories,
              selectedOptions: _selectedCategories,
              onToggle: (option) {
                setState(() {
                  if (_selectedCategories.contains(option)) {
                    _selectedCategories.remove(option);
                  } else {
                    _selectedCategories.add(option);
                  }
                });
              },
            ),
            SelectionSection(
              title: '지역',
              options: _regions,
              selectedOptions: _selectedRegions,
              onToggle: (option) {
                setState(() {
                  if (_selectedRegions.contains(option)) {
                    _selectedRegions.remove(option);
                  } else {
                    _selectedRegions.add(option);
                  }
                });
              },
            ),
            SelectionSection(
              title: '문화',
              options: _cultures,
              selectedOptions: _selectedCultures,
              onToggle: (option) {
                setState(() {
                  if (_selectedCultures.contains(option)) {
                    _selectedCultures.remove(option);
                  } else {
                    _selectedCultures.add(option);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
