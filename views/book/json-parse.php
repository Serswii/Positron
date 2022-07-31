<?php

/* @var $this yii\web\View */
/* @var $model app\models\Feedback */
/* @var $form ActiveForm */

$this->title = 'Positron';

use app\models\Books;
use yii\widgets\ActiveForm;
?>
<div class="site-index">

    <div class="container">
        <div class="row flex-column">
            <?php
            $url = file_get_contents("https://gitlab.com/prog-positron/test-app-vacancy/-/raw/master/books.json");
            $category = "";
            $content = json_decode($url, true);
            foreach ($content as $key => $subarray) {
                $model_book = new Books();
                foreach ($subarray as $keys => $item) {
                    if (is_array($item) && count($item)) {
                        foreach ($item as $key_array => $value) {
                            switch ($keys) {
                                case "publishedDate":
                                    $date = new DateTime($value);
                                    $model_book->publishedDate = $date->format('Y-m-d H:i:s');
                                    break;
                                case "categories":
                                    $model_book->checkCategoryDublicate($value);
                                    break;
                            }
                        }
                    } else {
                        switch ($keys) {
                            case "title":
                                $model_book->title = $item;
                                break;
                            case "isbn":
                                $model_book->isbn = $item;
                                break;
                            case "pageCount":
                                $model_book->pageCount = $item;
                                break;
                            case "thumbnailUrl":
                                preg_match("/[a-zA-Z0-9]*\.jpg/", $item, $array);
                                foreach ($array as $img) {
                                    $dir = '/images/books/' . $img;
                                    $path = Yii::getAlias('@webroot') . $dir;
                                    if (!file_exists($path) && $model_book->is_file_url_exists($item)) {
                                        $image = file_get_contents($item);
                                        file_put_contents($path, $image);
                                    }
                                    $model_book->thumbnailUrl = $dir;
                                }
                                break;
                            case "shortDescription":
                                $model_book->shortDescription = $item;
                                break;
                            case "longDescription":
                                $model_book->longDescription = $item;
                                break;
                            case "status":
                                $model_book->status = $item;
                                break;
                            case "categories":
                                $item = "Новинки";
                                $model_book->checkCategoryDublicate($item);
                                break;
                        }
                    }
                }
                $model_book->save();
            }
            ?>
        </div>
    </div>
</div>


